class ColorBarWidgetsController < ApplicationController
  before_action :set_color_bar_widget, only: [:show, :edit, :update, :destroy]

  # GET /color_bar_widgets
  # GET /color_bar_widgets.json
  def index
    @color_bar_widgets = ColorBarWidget.all
  end

  # GET /color_bar_widgets/1
  # GET /color_bar_widgets/1.json
  def show
  end

  # GET /color_bar_widgets/new
  def new
    @color_bar_widget = ColorBarWidget.new
  end

  # GET /color_bar_widgets/1/edit
  def edit
  end

  # POST /color_bar_widgets
  # POST /color_bar_widgets.json
  def create
    @color_bar_widget = ColorBarWidget.new(color_bar_widget_params)

    respond_to do |format|
      if @color_bar_widget.save
        format.html { redirect_to @color_bar_widget, notice: 'Color bar widget was successfully created.' }
        format.json { render :show, status: :created, location: @color_bar_widget }
      else
        format.html { render :new }
        format.json { render json: @color_bar_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /color_bar_widgets/1
  # PATCH/PUT /color_bar_widgets/1.json
  def update
    respond_to do |format|
      if @color_bar_widget.update(color_bar_widget_params)
        format.html { redirect_to @color_bar_widget, notice: 'Color bar widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @color_bar_widget }
      else
        format.html { render :edit }
        format.json { render json: @color_bar_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /color_bar_widgets/1
  # DELETE /color_bar_widgets/1.json
  def destroy
    @color_bar_widget.destroy
    respond_to do |format|
      format.html { redirect_to color_bar_widgets_url, notice: 'Color bar widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def bindUser
    @req = request.body.read
    unless @req.blank?
      @userId = params[:userId]
      @wdgLast = ColorBarWidget.last()
      unless @wdgLast.nil?
        @userWidget = UserWidget.find_by(:widgetable_type => "ColorBarWidget", :user_id => @userId.to_i)
        unless @userWidget.nil?
          puts "this user has widget binded"
          render json: JSON("result" => 1)
          return
        else
          @wdgLast = ColorBarWidget.create()
        end
      else
        @wdgLast = ColorBarWidget.create()
      end
      @wdgType = "ColorBarWidget"
      puts "parameters: ", @userId, @wdgLast[:id], @wdgType
      @newUserWidget = UserWidget.create(:user_id => @userId, :widgetable_type => @wdgType, :widgetable_id => @wdgLast[:id])
      @curUser = User.find(@userId)
      @curUser.user_widgets << @newUserWidget
      @wdgLast.user_widgets << @newUserWidget
      puts ''
      puts "Checking table"
      puts UserWidget.all.each { |e| puts e.inspect }
      @user_entries = User.includes(:user_widgets).where(user_widgets: {widgetable_type: 'ColorBarWidget'})
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
        @userWidget = UserWidget.find_by(:widgetable_type => "ColorBarWidget", :user_id => @userId.to_i)
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
    $stdout.puts "Handling COLOR BAR WIDGET color"
    @userId, @color = params[:userId].to_i, params[:color]
    puts @userId, @color
    if @userId != nil
      @userEntry = UserWidget.find_by(:widgetable_type => "ColorBarWidget", :user_id => @userId)
      if @userEntry.nil?
        puts "cant find entry for this user"
        render json: JSON("result" => "0")
        return
      else
        if (@color != nil)
          puts "updating color in database"
          ColorBarWidget.update(@userEntry[:widgetable_id], :color => @color)
          render json: JSON("result" => "0")
          return
        else
          puts "retrieving colors from database"
          @cbWdg = ColorBarWidget.find(@userEntry[:widgetable_id])
          @color = @cbWdg[:color]
          render json: JSON("result" => "1", "color" => @color)
          return
        end
      end
    else
      puts "userId is null"
      render json: JSON("result" => "0")
      return
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color_bar_widget
      @color_bar_widget = ColorBarWidget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def color_bar_widget_params
      params.require(:color_bar_widget).permit(:color)
    end
end
