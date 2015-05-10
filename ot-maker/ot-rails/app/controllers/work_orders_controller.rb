class WorkOrdersController < ApplicationController
  before_action :set_work_order, only: [:show, :edit, :update, :destroy, :accept, :refuse]

  add_breadcrumb "Dashboard", :root_path
  add_breadcrumb "Ordenes de Trabajo", :work_orders_path

  # Valores para el tributo :state de Change y Work_order
  # 0 recien creado        ** exclusivo de Change
  # 1 pendiente
  # 2 recien aceptado      ** exclusivo de Change
  # 3 aceptado
  # 4 Facturado //en caso de estar facturado no se puede modificar a menos que se saque de la factura que vuelve a estado 3
  # 5 recien desfacturado  ** exclusivo de Change
  # 6 rechazado
  # 7 Restaurado 

  # GET /work_orders
  def index
    @own_work_orders = WorkOrder.where(user:current_user).paginate(:page => params[:po])
    @assigned_work_orders = WorkOrder.where(user_assigned:current_user).paginate(:page => params[:pa])
  end

  # GET /work_orders/1
  def show
    add_breadcrumb "Ver Orden de Trabajo"
    @changes = Change.where(work_order:@work_order)
  end

  # GET /work_orders/new
  def new
    add_breadcrumb "Nueva Orden de Trabajo"
    @work_order = WorkOrder.new
  end

  # GET /work_orders/1/edit
  def edit
    add_breadcrumb "Editar Orden de Trabajo"
  end

  # POST /work_orders
  def create
    add_breadcrumb "Nueva Orden de Trabajo"
    @work_order = WorkOrder.new(work_order_params)
    @work_order.user = current_user
    @work_order.state = 1
    if (not @work_order.user_assigned) && @work_order.organization_assigned
      @work_order.user_assigned = @work_order.organization_assigned.user
    end

    if @work_order.save
      ## truco sucio : deberia usar before_save o algo asi
      change_register = Change.new()
      change_register.work_order = @work_order
      change_register.user = current_user
      change_register.user_assigned = @work_order.user_assigned
      change_register.code = @work_order.code
      change_register.title = @work_order.title
      change_register.description = @work_order.description
      change_register.bill_order = @work_order.bill_order
      change_register.state = 0
      change_register.save
      redirect_to @work_order, notice: 'Work order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /work_orders/1
  def update
    add_breadcrumb "Editar Orden de Trabajo"

    if @work_order.update(work_order_params)
      change_register = Change.new()
      change_register.work_order = @work_order
      change_register.user = current_user
      change_register.user_assigned = @work_order.user_assigned
      change_register.code = @work_order.code
      change_register.title = @work_order.title
      change_register.description = @work_order.description
      change_register.bill_order = @work_order.bill_order
      change_register.state = @work_order.state
      change_register.save
      redirect_to @work_order, notice: 'Work order was successfully updated.'
    else
      render :edit
    end
  end

  # Listado de work_orders pendientes
  def pending
    add_breadcrumb "Ordenes de Trabajo pendientes"
    @assigned_work_orders = WorkOrder.where(user_assigned:current_user).where(state:1).paginate(:page => params[:pa])
  end

  def accept
    @work_order.update({state:3})
    change_register = Change.new()
    change_register.work_order = @work_order
    change_register.user = current_user
    change_register.user_assigned = @work_order.user_assigned
    change_register.code = @work_order.code
    change_register.title = @work_order.title
    change_register.description = @work_order.description
    change_register.bill_order = @work_order.bill_order
    change_register.state = 2
    change_register.save
    redirect_to work_orders_pending_path, notice: 'Se ha aceptado la Orden de Trabajo.'
  end

  def refuse
    @work_order.update({state:6})
    change_register = Change.new()
    change_register.work_order = @work_order
    change_register.user = current_user
    change_register.user_assigned = @work_order.user_assigned
    change_register.code = @work_order.code
    change_register.title = @work_order.title
    change_register.description = @work_order.description
    change_register.bill_order = @work_order.bill_order
    change_register.state = 6
    change_register.save
    redirect_to work_orders_pending_path, notice: 'Se ha rechazado la Orden de Trabajo.'
  end

  # DELETE /work_orders/1
  def destroy
    @work_order.destroy
    redirect_to work_orders_url, notice: 'Work order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def work_order_params
      params.require(:work_order).permit(:code, :title, :description, :state, :user_id, :user_assigned_id, :organization_id, :organization_assigned_id, :bill_order_id)
    end
end
