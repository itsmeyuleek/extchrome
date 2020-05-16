class ColorPaletteWidgetsController < ApplicationController
  before_action :set_color_palette_widget, only: [:show, :edit, :update, :destroy]

  # GET /color_palette_widgets
  # GET /color_palette_widgets.json
  def index
    @color_palette_widgets = ColorPaletteWidget.all
  end

  # GET /color_palette_widgets/1
  # GET /color_palette_widgets/1.json
  def show
  end

  # GET /color_palette_widgets/new
  def new
    @color_palette_widget = ColorPaletteWidget.new
  end

  # GET /color_palette_widgets/1/edit
  def edit
  end

  # POST /color_palette_widgets
  # POST /color_palette_widgets.json
  def create
    @color_palette_widget = ColorPaletteWidget.new(color_palette_widget_params)

    respond_to do |format|
      if @color_palette_widget.save
        format.html { redirect_to @color_palette_widget, notice: 'Color palette widget was successfully created.' }
        format.json { render :show, status: :created, location: @color_palette_widget }
      else
        format.html { render :new }
        format.json { render json: @color_palette_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /color_palette_widgets/1
  # PATCH/PUT /color_palette_widgets/1.json
  def update
    respond_to do |format|
      if @color_palette_widget.update(color_palette_widget_params)
        format.html { redirect_to @color_palette_widget, notice: 'Color palette widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @color_palette_widget }
      else
        format.html { render :edit }
        format.json { render json: @color_palette_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /color_palette_widgets/1
  # DELETE /color_palette_widgets/1.json
  def destroy
    @color_palette_widget.destroy
    respond_to do |format|
      format.html { redirect_to color_palette_widgets_url, notice: 'Color palette widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def bindUser
    @req = request.body.read
    unless @req.blank?
      @userId = params[:userId]
      @wdgLast = ColorPaletteWidget.last()
      unless @wdgLast.nil?
        @userWidget = UserWidget.find_by(:widgetable_type => "ColorPaletteWidget", :user_id => @userId.to_i)
        unless @userWidget.nil?
          puts "this user has widget binded"
          render json: JSON("result" => 1)
          return
        else
          @wdgLast = ColorPaletteWidget.create()
        end
      else
        @wdgLast = ColorPaletteWidget.create()
      end
      @wdgType = "ColorPaletteWidget"
      puts "parameters: ", @userId, @wdgLast[:id], @wdgType
      @newUserWidget = UserWidget.create(:user_id => @userId, :widgetable_type => @wdgType, :widgetable_id => @wdgLast[:id])
      @curUser = User.find(@userId)
      @curUser.user_widgets << @newUserWidget
      @wdgLast.user_widgets << @newUserWidget
      puts ''
      puts "Checking table"
      puts UserWidget.all.each { |e| puts e.inspect }
      @user_entries = User.includes(:user_widgets).where(user_widgets: {widgetable_type: "ColorPaletteWidget"})
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
      @wdgLast = ColorPaletteWidget.last()
      unless @wdgLast.nil?
        @userWidget = UserWidget.find_by(:widgetable_type => "ColorPaletteWidget", :user_id => @userId.to_i)
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
    $stdout.puts "Handling color bar color"
    @userId, @color, @selectedScheme = params[:userId].to_i, params[:color], params[:selectedScheme]
    puts @userId, @color, @selectedScheme
    if @userId != nil
      @userEntry = UserWidget.find_by(:widgetable_type => "ColorPaletteWidget", :user_id => @userId)
      if @userEntry.nil?
        puts "cant find entry for this user"
        render json: JSON("result" => "-1")
        return
      else
        if (@color != nil)
          puts "updating color in database"
          ColorPaletteWidget.update(@userEntry[:widgetable_id], :color => @color, :selected_scheme => @selectedScheme)
          render json: JSON("result" => "0")
          return
        else
          puts "retrieving colors from database"
          @cpWdg = ColorPaletteWidget.find(@userEntry[:widgetable_id])
          @color = @cpWdg[:color]
          @selectedScheme = @cpWdg[:selected_scheme]
          render json: JSON("result" => "0", "color" => @color, "selectedScheme" => @selectedScheme)
          return
        end
      end
    else
      "no user id, cant do anything"
      render json: JSON("result" => "-1")
      return
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color_palette_widget
      @color_palette_widget = ColorPaletteWidget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def color_palette_widget_params
      params.require(:color_palette_widget).permit(:color, :type)
    end
end
