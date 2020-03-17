require "json"

class GradientWidgetsController < ApplicationController
  before_action :set_gradient_widget, only: [:show, :edit, :update, :destroy]

  # GET /gradient_widgets
  # GET /gradient_widgets.json
  def index
    @gradient_widgets = GradientWidget.all
  end

  # GET /gradient_widgets/1
  # GET /gradient_widgets/1.json
  def show
  end

  # GET /gradient_widgets/new
  def new
    @gradient_widget = GradientWidget.new
  end

  # GET /gradient_widgets/1/edit
  def edit
  end

  # POST /gradient_widgets
  # POST /gradient_widgets.json
  def create
    @gradient_widget = GradientWidget.new(gradient_widget_params)

    respond_to do |format|
      if @gradient_widget.save
        format.html { redirect_to @gradient_widget, notice: 'Gradient widget was successfully created.' }
        format.json { render :show, status: :created, location: @gradient_widget }
      else
        format.html { render :new }
        format.json { render json: @gradient_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gradient_widgets/1
  # PATCH/PUT /gradient_widgets/1.json
  def update
    respond_to do |format|
      if @gradient_widget.update(gradient_widget_params)
        format.html { redirect_to @gradient_widget, notice: 'Gradient widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @gradient_widget }
      else
        format.html { render :edit }
        format.json { render json: @gradient_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gradient_widgets/1
  # DELETE /gradient_widgets/1.json
  def destroy
    @gradient_widget.destroy
    respond_to do |format|
      format.html { redirect_to gradient_widgets_url, notice: 'Gradient widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def bindUser
    @req = request.body.read
    unless @req.blank?
      @userId = params[:userId]
      @wdgLast = GradientWidget.last()
      unless @wdgLast.nil?
        @userWidget = UserWidget.find_by(:widgetable_type => "GradientWidget", :user_id => @userId.to_i)
        unless @userWidget.nil?
          puts "this user has widget binded"
          render json: JSON("result" => 1)
          return
        else
          @wdgLast = GradientWidget.create()
        end
      else
        @wdgLast = GradientWidget.create()
      end
      @wdgType = "GradientWidget"
      puts "parameters: ", @userId, @wdgLast[:id], @wdgType
      @newUserWidget = UserWidget.create(:user_id => @userId, :widgetable_type => @wdgType, :widgetable_id => @wdgLast[:id])
      @curUser = User.find(@userId)
      @curUser.user_widgets << @newUserWidget
      @wdgLast.user_widgets << @newUserWidget
      puts ''
      puts "Checking table"
      puts UserWidget.all.each { |e| puts e.inspect }
      @user_entries = User.includes(:user_widgets).where(user_widgets: {widgetable_type: 'GradientWidget'})
      @user_entries.each do |u|
        puts u[:user_id]
      end
      render json: JSON("result" => '1')
      return
    else
      $stoud.puts "cant bind, no user id"
      render json: JSON("result" => '0')
    end
  end

  def unbindUser
    @req = request.body.read
    unless @req.blank?
      @userId = params[:userId]
      @wdgLast = ColorBarWidget.last()
      unless @wdgLast.nil?
        @userWidget = UserWidget.find_by(:widgetable_type => "GradientWidget", :user_id => @userId.to_i)
        unless @userWidget.nil?
          @userWidget.destroy
          puts "widget has been unbinded"
          render json: JSON("result" => 1)
          return
        else
          render json: JSON("result" => 0)
          return
        end
      else
        render json: JSON("result" => 0)
        return
      end
    else
      $stoud.puts "cant destroy, no user id"
      render json: JSON("result" => '0')
    end
  end

  def handleColor
    $stdout.puts "Handling gradient colors"
    @userId, @startColor, @endColor = params[:userId].to_i, params[:startColor], params[:endColor]
    puts @userId, @startColor, @endColor
    if @userId != nil
      @userEntry = UserWidget.find_by(:widgetable_type => "GradientWidget", :user_id => @userId)
      if @userEntry.nil?
        puts "cant find entry for this user"
        render json: JSON("result" => "0")
        return
      else
        if (@startColor != nil) && (@endColor != nil)
          puts "updating color in database"
          GradientWidget.update(@userEntry[:widgetable_id], :start_color => @startColor, :end_color => @endColor)
          render json: JSON("result" => "0")
          return
        else
          puts "retrieving colors from database"
          @grdWdg = GradientWidget.find(@userEntry[:widgetable_id])
          @startColor, @endColor = @grdWdg[:start_color], @grdWdg[:end_color]
          render json: JSON("result" => "1", "startColor" => @startColor, "endColor" => @endColor)
          return
        end
      end
    else
      "no user id, cant do anything"
      render json: JSON("result" => "0")
      return
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gradient_widget
      @gradient_widget = GradientWidget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gradient_widget_params
      params.require(:gradient_widget).permit(:start_color, :end_color)
    end
end
