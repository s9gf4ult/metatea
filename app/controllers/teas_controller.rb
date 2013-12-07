class TeasController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /teas
  # GET /teas.json
  def index
    if params[:tea] && params[:tea][:category]
      @teas = Tea.where(:category => params[:tea][:category])
    else
      @teas = Tea.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teas }
    end
  end

  # GET /teas/1
  # GET /teas/1.json
  def show
    @tea = Tea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tea }
    end
  end

  # GET /teas/new
  # GET /teas/new.json
  def new
    @tea = Tea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tea }
    end
  end

  # GET /teas/1/edit
  def edit
    @tea = Tea.find(params[:id])
  end

  # POST /teas
  # POST /teas.json
  def create
    @tea = Tea.new(params[:tea])
    @tea.user = current_user
    respond_to do |format|
      if @tea.save
        format.html { redirect_to @tea, notice: 'Tea was successfully created.' }
        format.json { render json: @tea, status: :created, location: @tea }
      else
        format.html { render action: "new" }
        format.json { render json: @tea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teas/1
  # PUT /teas/1.json
  def update
    @tea = Tea.find(params[:id])
    if @tea.user == current_user
      respond_to do |format|
        if @tea.update_attributes(params[:tea].except(:user_id))
          format.html { redirect_to @tea, notice: 'Tea was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @tea.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to teas_path, :warning => "You can not modify this tea" }
      end
    end
  end

  # DELETE /teas/1
  # DELETE /teas/1.json
  def destroy
    @tea = Tea.find(params[:id])
    if @tea.user == current_user
      other = @tea.choose_other_user
      respond_to do |format|
        if other                # there is otner users who own this tea in list
          @tea.user = other
          if @tea.save
            format.html { redirect_to teas_path }
            format.json { head :no_content }
          else
            @tea.destroy
            format.html { redirect_to teas_path }
            format.json { head :no_content }
          end
        else
          @tea.destroy          # realy stupid
          format.html { redirect_to teas_path }
          format.json { head :no_content }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to teas_path, :warning => "You can not delete this tea" }
      end
    end
  end

  # POST
  def comment
    @tea = Tea.find params[:id]
    comment = @tea.comments.new
    comment.comment = params[:tea][:comment]
    comment.user = current_user
    comment.save
    respond_to do |format|
      format.html { redirect_to @tea }
    end
  end

end
