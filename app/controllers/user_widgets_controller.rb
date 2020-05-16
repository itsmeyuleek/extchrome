class UserWidgetsController < ApplicationController
  before_action :set_user_widget, only: [:show, :edit, :update, :destroy]

  # GET /user_widgets
  # GET /user_widgets.json
  def index
    @user_widgets = UserWidget.all
  end

  # GET /user_widgets/1
  # GET /user_widgets/1.json
  def show
  end

  # GET /user_widgets/new
  def new
    @user_widget = UserWidget.new
  end

  # GET /user_widgets/1/edit
  def edit
  end

  # POST /user_widgets
  # POST /user_widgets.json
  def create
    @user_widget = UserWidget.new(user_widget_params)

    respond_to do |format|
      if @user_widget.save
        format.html { redirect_to @user_widget, notice: 'User widget was successfully created.' }
        format.json { render :show, status: :created, location: @user_widget }
      else
        format.html { render :new }
        format.json { render json: @user_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_widgets/1
  # PATCH/PUT /user_widgets/1.json
  def update
    respond_to do |format|
      if @user_widget.update(user_widget_params)
        format.html { redirect_to @user_widget, notice: 'User widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_widget }
      else
        format.html { render :edit }
        format.json { render json: @user_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_widgets/1
  # DELETE /user_widgets/1.json
  def destroy
    @user_widget.destroy
    respond_to do |format|
      format.html { redirect_to user_widgets_url, notice: 'User widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def getWidgets
    @userId = params[:userId]
    @widgets = UserWidget.where(:user_id => @userId).find_each
    puts(@widgets.inspect)
    render json: { results: @widgets.map{ |e| { type: e.widgetable_type }}}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_widget
      @user_widget = UserWidget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_widget_params
      params.require(:user_widget).permit(:user_id, :widgetable_type, :widgetable_id)
    end
end
