class TeaComparsionsController < ApplicationController
  # GET /tea_comparsions
  # GET /tea_comparsions.json
  def index
    @tea_comparsions = TeaComparsion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tea_comparsions }
    end
  end

  # GET /tea_comparsions/1
  # GET /tea_comparsions/1.json
  def show
    @tea_comparsion = TeaComparsion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tea_comparsion }
    end
  end

  # GET /tea_comparsions/new
  # GET /tea_comparsions/new.json
  def new
    @tea_comparsion = TeaComparsion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tea_comparsion }
    end
  end

  # GET /tea_comparsions/1/edit
  def edit
    @tea_comparsion = TeaComparsion.find(params[:id])
  end

  # POST /tea_comparsions
  # POST /tea_comparsions.json
  def create
    @tea_comparsion = TeaComparsion.new(params[:tea_comparsion])

    respond_to do |format|
      if @tea_comparsion.save
        format.html { redirect_to @tea_comparsion, notice: 'Tea comparsion was successfully created.' }
        format.json { render json: @tea_comparsion, status: :created, location: @tea_comparsion }
      else
        format.html { render action: "new" }
        format.json { render json: @tea_comparsion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tea_comparsions/1
  # PUT /tea_comparsions/1.json
  def update
    @tea_comparsion = TeaComparsion.find(params[:id])

    respond_to do |format|
      if @tea_comparsion.update_attributes(params[:tea_comparsion])
        format.html { redirect_to @tea_comparsion, notice: 'Tea comparsion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tea_comparsion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tea_comparsions/1
  # DELETE /tea_comparsions/1.json
  def destroy
    @tea_comparsion = TeaComparsion.find(params[:id])
    @tea_comparsion.destroy

    respond_to do |format|
      format.html { redirect_to tea_comparsions_url }
      format.json { head :no_content }
    end
  end
end
