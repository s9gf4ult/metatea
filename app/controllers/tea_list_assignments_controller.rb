class TeaListAssignmentsController < ApplicationController
  # GET /tea_list_assignments
  # GET /tea_list_assignments.json
  def index
    @tea_list_assignments = TeaListAssignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tea_list_assignments }
    end
  end

  # GET /tea_list_assignments/1
  # GET /tea_list_assignments/1.json
  def show
    @tea_list_assignment = TeaListAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tea_list_assignment }
    end
  end

  # GET /tea_list_assignments/new
  # GET /tea_list_assignments/new.json
  def new
    @tea_list_assignment = TeaListAssignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tea_list_assignment }
    end
  end

  # GET /tea_list_assignments/1/edit
  def edit
    @tea_list_assignment = TeaListAssignment.find(params[:id])
  end

  # POST /tea_list_assignments
  # POST /tea_list_assignments.json
  def create
    @tea_list_assignment = TeaListAssignment.new(params[:tea_list_assignment])

    respond_to do |format|
      if @tea_list_assignment.save
        format.html { redirect_to @tea_list_assignment, notice: 'Tea list assignment was successfully created.' }
        format.json { render json: @tea_list_assignment, status: :created, location: @tea_list_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @tea_list_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tea_list_assignments/1
  # PUT /tea_list_assignments/1.json
  def update
    @tea_list_assignment = TeaListAssignment.find(params[:id])

    respond_to do |format|
      if @tea_list_assignment.update_attributes(params[:tea_list_assignment])
        format.html { redirect_to @tea_list_assignment, notice: 'Tea list assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tea_list_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tea_list_assignments/1
  # DELETE /tea_list_assignments/1.json
  def destroy
    @tea_list_assignment = TeaListAssignment.find(params[:id])
    @tea_list_assignment.destroy

    respond_to do |format|
      format.html { redirect_to tea_list_assignments_url }
      format.json { head :no_content }
    end
  end
end
