class TeaComparsionsController < ApplicationController
  include TeaComparsionsHelper

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


  # POST /tea_comparsions
  # POST /tea_comparsions.json
  def create
    @left_tea = Tea.find params[:tea_comparsion][:left_tea_id]
    @right_tea = Tea.find params[:tea_comparsion][:right_tea_id]

    @tea_comparsion = TeaComparsion.new(params[:tea_comparsion])
    @tea_comparsion.left_tea = @left_tea
    @tea_comparsion.right_tea = @right_tea
    @tea_comparsion.user = current_user
    TeaComparsion.where(:user_id => current_user.id, :axis_name => @tea_comparsion.axis_name).with_teas(@left_tea, @right_tea).destroy_all

    fid = params[:first_tea_id]
    if fid && (fid.to_i == @left_tea.id.to_i)
      @first_tea = @left_tea
      @second_tea = @right_tea
    else
      @first_tea = @right_tea
      @second_tea = @left_tea
    end

    respond_to do |format|
      if @tea_comparsion.save
        format.html { redirect_to compare_teas_path(@first_tea, @second_tea), notice: 'Tea comparsion was successfully created.' }
        format.json { render json: @tea_comparsion, status: :created, location: @tea_comparsion }
      else
        format.html { redirect_to compare_teas_path(@first_tea, @second_tea), :warning => "Could not create comparion" }
        format.json { render json: @tea_comparsion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tea_comparsions/1
  # DELETE /tea_comparsions/1.json
  def destroy
    @tea_comparsion = TeaComparsion.find(params[:id])
    left_tea = @tea_comparsion.left_tea
    right_tea = @tea_comparsion.right_tea
    fid = params[:first_tea_id]
    if fid && fid.to_i == left_tea.id.to_i
      first_tea = left_tea
      second_tea = right_tea
    else
      first_tea = right_tea
      second_tea = left_tea
    end
    if @tea_comparsion.user == current_user
      @tea_comparsion.destroy
      respond_to do |format|
        format.html { redirect_to compare_teas_path(first_tea, second_tea) }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to compare_teas_path(first_tea, second_tea), :warning => "You can not delete this comparsion"}
      end
    end
  end
end
