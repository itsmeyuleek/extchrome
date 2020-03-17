class ColorSchemeWidgetsController < ApplicationController
  before_action :set_color_scheme_widget, only: [:show, :edit, :update, :destroy]

  # GET /color_scheme_widgets
  # GET /color_scheme_widgets.json
  def index
    @color_scheme_widgets = ColorSchemeWidget.all
  end

  # GET /color_scheme_widgets/1
  # GET /color_scheme_widgets/1.json
  def show
  end

  # GET /color_scheme_widgets/new
  def new
    @color_scheme_widget = ColorSchemeWidget.new
  end

  # GET /color_scheme_widgets/1/edit
  def edit
  end

  # POST /color_scheme_widgets
  # POST /color_scheme_widgets.json
  def create
    @color_scheme_widget = ColorSchemeWidget.new(color_scheme_widget_params)

    respond_to do |format|
      if @color_scheme_widget.save
        format.html { redirect_to @color_scheme_widget, notice: 'Color scheme widget was successfully created.' }
        format.json { render :show, status: :created, location: @color_scheme_widget }
      else
        format.html { render :new }
        format.json { render json: @color_scheme_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /color_scheme_widgets/1
  # PATCH/PUT /color_scheme_widgets/1.json
  def update
    respond_to do |format|
      if @color_scheme_widget.update(color_scheme_widget_params)
        format.html { redirect_to @color_scheme_widget, notice: 'Color scheme widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @color_scheme_widget }
      else
        format.html { render :edit }
        format.json { render json: @color_scheme_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /color_scheme_widgets/1
  # DELETE /color_scheme_widgets/1.json
  def destroy
    @color_scheme_widget.destroy
    respond_to do |format|
      format.html { redirect_to color_scheme_widgets_url, notice: 'Color scheme widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color_scheme_widget
      @color_scheme_widget = ColorSchemeWidget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def color_scheme_widget_params
      params.fetch(:color_scheme_widget, {})
    end
end
