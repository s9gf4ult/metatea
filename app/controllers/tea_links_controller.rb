class TeaLinksController < ApplicationController
  before_filter :authenticate_user!

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

  # POST /tea_links
  # POST /tea_links.json
  def create
    @tea_link = TeaLink.new(params[:tea_link])
    @tea = @tea_link.tea
    @tea_link.user = current_user
    respond_to do |format|
      if @tea_link.save
        format.html { redirect_to @tea, notice: 'Tea link was successfully created.' }
        format.json { render json: @tea_link, status: :created, location: @tea_link }
      else
        format.html { render action: "new" }
        format.json { render json: @tea_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tea_links/1
  # DELETE /tea_links/1.json
  def destroy
    @tea_link = TeaLink.find(params[:id])
    @tea = @tea_link.tea
    if @tea_link.user == current_user || @tea.user == current_user
      @tea_link.destroy
      respond_to do |format|
        format.html { redirect_to @tea }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @tea, :warning => "You can not remove this link" }
        format.json { head :no_content }
      end
    end
  end
end
