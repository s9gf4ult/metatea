class TeaListAssignmentsController < ApplicationController
  before_filter :authenticate_user!

  SETTINGS[:user][:lists].each do |lname|
    define_method lname do
      @teas = current_user.teas_in_list(lname)
      respond_to do |format|
        format.html { render "teas/index" }
        format.json { render :json => @teas }
      end
    end
  end

  # POST /tea_list_assignments
  # POST /tea_list_assignments.json
  def create
    @tea_list_assignment = TeaListAssignment.new(params[:tea_list_assignment])
    tea = Tea.find params[:tea_list_assignment][:tea_id]
    @tea_list_assignment.tea = tea
    @tea_list_assignment.user = current_user

    respond_to do |format|
      if @tea_list_assignment.save
        format.html { redirect_to @tea_list_assignment.tea, notice: 'Tea list assignment was successfully created.' }
        format.json { render json: @tea_list_assignment, status: :created, location: @tea_list_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @tea_list_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tea_list_assignments/1
  # DELETE /tea_list_assignments/1.json
  def destroy
    @tea_list_assignment = TeaListAssignment.find(params[:id])
    tea = @tea_list_assignment.tea
    if @tea_list_assignment.user == current_user
      @tea_list_assignment.destroy

      respond_to do |format|
        format.html { redirect_to tea }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to :root, :warning => "You can not destroy this assignment"}
      end
    end
  end
end
