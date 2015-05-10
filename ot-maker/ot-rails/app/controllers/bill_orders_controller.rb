class BillOrdersController < ApplicationController
  before_action :set_bill_order, only: [:show, :edit, :update, :destroy]

  # GET /bill_orders
  def index
    @bill_orders = BillOrder.paginate(:page => params[:page])
  end

  # GET /bill_orders/1
  def show
  end

  # GET /bill_orders/new
  def new
    @bill_order = BillOrder.new
    @work_orders_ready = WorkOrder.where(state:3).where(user:current_user)
  end

  # GET /bill_orders/1/edit
  def edit
  end

  # POST /bill_orders
  def create
    @bill_order = BillOrder.new(bill_order_params)
    @work_orders_ready = WorkOrder.where(state:3).where(user:current_user)

    if @bill_order.save
      redirect_to @bill_order, notice: 'Bill order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bill_orders/1
  def update
    if @bill_order.update(bill_order_params)
      redirect_to @bill_order, notice: 'Bill order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bill_orders/1
  def destroy
    @bill_order.destroy
    redirect_to bill_orders_url, notice: 'Bill order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_order
      @bill_order = BillOrder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bill_order_params
      params.require(:bill_order).permit(:folio, :issued, :status)
    end
end
