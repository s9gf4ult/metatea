class TeaLinksController < ApplicationController
  # GET /tea_links
  # GET /tea_links.json
  def index
    @tea_links = TeaLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tea_links }
    end
  end

  # GET /tea_links/1
  # GET /tea_links/1.json
  def show
    @tea_link = TeaLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tea_link }
    end
  end

  # GET /tea_links/new
  # GET /tea_links/new.json
  def new
    @tea_link = TeaLink.new
    @tea = Tea.find params[:tea][:id] if params[:tea]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tea_link }
    end
  end

  # GET /tea_links/1/edit
  def edit
    @tea_link = TeaLink.find(params[:id])
  end

  # POST /tea_links
  # POST /tea_links.json
  def create
    @tea_link = TeaLink.new(params[:tea_link])

    respond_to do |format|
      if @tea_link.save
        format.html { redirect_to @tea_link, notice: 'Tea link was successfully created.' }
        format.json { render json: @tea_link, status: :created, location: @tea_link }
      else
        format.html { render action: "new" }
        format.json { render json: @tea_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tea_links/1
  # PUT /tea_links/1.json
  def update
    @tea_link = TeaLink.find(params[:id])

    respond_to do |format|
      if @tea_link.update_attributes(params[:tea_link])
        format.html { redirect_to @tea_link, notice: 'Tea link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tea_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tea_links/1
  # DELETE /tea_links/1.json
  def destroy
    @tea_link = TeaLink.find(params[:id])
    @tea_link.destroy

    respond_to do |format|
      format.html { redirect_to tea_links_url }
      format.json { head :no_content }
    end
  end
end
