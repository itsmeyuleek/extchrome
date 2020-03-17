class AssociationsController < ApplicationController
  before_action :set_association, only: [:show, :edit, :update, :destroy]

  # GET /associations
  # GET /associations.json
  def index
    @associations = Association.all
  end

  # GET /associations/1
  # GET /associations/1.json
  def show
  end

  # GET /associations/new
  def new
    @association = Association.new
  end

  # GET /associations/1/edit
  def edit
  end

  # POST /associations
  # POST /associations.json
  def create
    @association = Association.new(association_params)

    respond_to do |format|
      if @association.save
        format.html { redirect_to @association, notice: 'Association was successfully created.' }
        format.json { render :show, status: :created, location: @association }
      else
        format.html { render :new }
        format.json { render json: @association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /associations/1
  # PATCH/PUT /associations/1.json
  def update
    respond_to do |format|
      if @association.update(association_params)
        format.html { redirect_to @association, notice: 'Association was successfully updated.' }
        format.json { render :show, status: :ok, location: @association }
      else
        format.html { render :edit }
        format.json { render json: @association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /associations/1
  # DELETE /associations/1.json
  def destroy
    @association.destroy
    respond_to do |format|
      format.html { redirect_to associations_url, notice: 'Association was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def bindUser
    @req = request.body.read
    unless @req.blank?
      @userId = params[:userId]
      @wdgLast = Association.last()
      unless @wdgLast.nil?
        @userWidget = UserWidget.find_by(:widgetable_type => "Association", :user_id => @userId.to_i)
        unless @userWidget.nil?
          puts "this user has widget binded"
          render json: JSON("result" => 1)
          return
        else
          @wdgLast = Association.create()
        end
      else
        @wdgLast = Association.create()
      end
      @wdgType = "Association"
      puts "parameters: ", @userId, @wdgLast[:id], @wdgType
      @newUserWidget = UserWidget.create(:user_id => @userId, :widgetable_type => @wdgType, :widgetable_id => @wdgLast[:id])
      @curUser = User.find(@userId)
      @curUser.user_widgets << @newUserWidget
      @wdgLast.user_widgets << @newUserWidget
      puts ''
      puts "Checking table"
      puts UserWidget.all.each { |e| puts e.inspect }
      @user_entries = User.includes(:user_widgets).where(user_widgets: {widgetable_type: 'Association'})
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
        @userWidget = UserWidget.find_by(:widgetable_type => "Association", :user_id => @userId.to_i)
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

  def handleText
    $stdout.puts "Handling text"
    @userId, @word, @words = params[:userId].to_i, params[:word], params[:words]
    puts @userId, @word, @words
    if @userId != nil
      @userEntry = UserWidget.find_by(:widgetable_type => "Association", :user_id => @userId)
      if @userEntry.nil?
        puts "cant find entry for this user"
        render json: JSON("result" => "0")
        return
      else
        if (@word != nil) && (@words != nil)
          puts "updating color in database"
          Association.update(@userEntry[:widgetable_id], :input_word => @word, :words => @words)
          render json: JSON("result" => "0")
          return
        else
          puts "retrieving colors from database"
          @grdWdg = Association.find(@userEntry[:widgetable_id])
          @word, @words= @grdWdg[:input_word], @grdWdg[:words]
          render json: JSON("result" => "1", "word" => @word, "words" => @words)
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
    def set_association
      @association = Association.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def association_params
      params.require(:association).permit(:words, :input_word)
    end
end
