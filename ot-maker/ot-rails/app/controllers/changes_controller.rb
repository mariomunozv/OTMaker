class ChangesController < ApplicationController
  before_action :set_change, only: [:show, :edit, :update, :destroy, :restore]

  # GET /changes
  def index
    @changes = Change.paginate(:page => params[:page])
  end

  # GET /changes/1
  def show
  end

  # GET /changes/new
  def new
    @change = Change.new
  end

  # GET /changes/1/edit
  def edit
  end

  def restore
    work_order = @change.work_order
    if @change.state==0
        state = 1
    elsif @change.state==2 || @change.state == 5
        state = 3
    else
        state = @change.state
    end
    if work_order.update({code: @change.code, title: @change.title, description: @change.description, bill_order: @change.bill_order, state: state})
        change_register = Change.new()
        change_register.work_order = work_order
        change_register.user = current_user
        change_register.user_assigned = work_order.user_assigned
        change_register.code = work_order.code
        change_register.title = work_order.title
        change_register.description = work_order.description
        change_register.bill_order = work_order.bill_order
        change_register.state = state + 10
        change_register.save
    end 
    redirect_to work_order, notice: 'Se ha vuelto a este punto.'
  end

  # POST /changes
  def create
    @change = Change.new(change_params)

    if @change.save
      redirect_to @change, notice: 'Change was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /changes/1
  def update
    if @change.update(change_params)
      redirect_to @change, notice: 'Change was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /changes/1
  def destroy
    @change.destroy
    redirect_to changes_url, notice: 'Change was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_change
      @change = Change.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def change_params
      params.require(:change).permit(:work_order_id, :user_id, :state, :code, :title, :description, :bill_order_id)
    end
end
