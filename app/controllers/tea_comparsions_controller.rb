class TeaComparsionsController < ApplicationController
  before_filter :authenticate_user!

  # GET
  def select_second
    @first_tea = Tea.find params[:first_tea_id]
    @teas = current_user.teas_in_list(:tried).where('teas.id <> ?', @first_tea.id)

  end

  # GET
  def comparsion
    @first_tea = Tea.find params[:first_tea_id]
    @second_tea = Tea.find params[:second_tea_id]
  end


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
    @left_tea = Tea.find params[:tea_comparsion][:left_tea_id]
    @right_tea = Tea.find params[:tea_comparsion][:right_tea_id]

    @tea_comparsion = TeaComparsion.new(params[:tea_comparsion])
    @tea_comparsion.left_tea = @left_tea
    @tea_comparsion.right_tea = @right_tea
    @tea_comparsion.user = current_user

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
