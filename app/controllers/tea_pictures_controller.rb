class TeaPicturesController < ApplicationController
  # GET /tea_pictures
  # GET /tea_pictures.json
  def index
    @tea_pictures = TeaPicture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tea_pictures }
    end
  end

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tea_picture }
    end
  end

  # GET /tea_pictures/1/edit
  def edit
    @tea_picture = TeaPicture.find(params[:id])
  end

  # POST /tea_pictures
  # POST /tea_pictures.json
  def create
    @tea_picture = TeaPicture.new(params[:tea_picture])

    respond_to do |format|
      if @tea_picture.save
        format.html { redirect_to @tea_picture, notice: 'Tea picture was successfully created.' }
        format.json { render json: @tea_picture, status: :created, location: @tea_picture }
      else
        format.html { render action: "new" }
        format.json { render json: @tea_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tea_pictures/1
  # PUT /tea_pictures/1.json
  def update
    @tea_picture = TeaPicture.find(params[:id])

    respond_to do |format|
      if @tea_picture.update_attributes(params[:tea_picture])
        format.html { redirect_to @tea_picture, notice: 'Tea picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tea_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tea_pictures/1
  # DELETE /tea_pictures/1.json
  def destroy
    @tea_picture = TeaPicture.find(params[:id])
    @tea_picture.destroy

    respond_to do |format|
      format.html { redirect_to tea_pictures_url }
      format.json { head :no_content }
    end
  end
end
