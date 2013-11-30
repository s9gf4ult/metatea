class TeaPicturesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  # GET /tea_pictures/1
  # GET /tea_pictures/1.json
  def show
    @tea_picture = TeaPicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tea_picture }
    end
  end

  # GET /tea_pictures/new
  # GET /tea_pictures/new.json
  def new
    @tea_picture = TeaPicture.new
    @tea = Tea.find params[:tea][:id] if params[:tea]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tea_picture }
    end
  end

  # POST /tea_pictures
  # POST /tea_pictures.json
  def create
    @tea = Tea.find params[:tea_picture][:tea_id] if params[:tea_picture][:tea_id]
    @tea_picture = TeaPicture.new(params[:tea_picture])
    @tea_picture.tea = @tea
    @tea_picture.user = current_user

    respond_to do |format|
      if @tea_picture.save
        format.html { redirect_to @tea_picture.tea, notice: 'Tea picture was successfully created.' }
        format.json { render json: @tea_picture, status: :created, location: @tea_picture }
      else
        format.html { render action: "new" }
        format.json { render json: @tea_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tea_pictures/1
  # DELETE /tea_pictures/1.json
  def destroy
    @tea_picture = TeaPicture.find(params[:id])
    @tea = @tea_picture.tea
    if @tea_picture.user == current_user ||
        @tea_picture.tea.user == current_user

      @tea_picture.destroy
      respond_to do |format|
        format.html { redirect_to @tea }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @tea, :warning => "You can not deattach this picture"}
        format.json { head :no_content }
      end
    end
  end
end
