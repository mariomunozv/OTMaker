class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy, :show_participation]

  add_breadcrumb "Dashboard", :root_path
  add_breadcrumb "Grupos", :organizations_path

  # GET /organizations
  def index
    @organizations = Organization.where(user:current_user).paginate(:page => params[:porg])
    @participations = Participation.where(user:current_user).paginate(:page => params[:ppar])#no se como paginar multipes tablas.
  end

  # GET /organizations/1
  def show
    add_breadcrumb "Detalle"
    if @organization.user == current_user
      @participations = Participation.where(organization:@organization).paginate(:page => params[:page])  
    else
      @participations = Participation.where(state:1).where(organization:@organization).paginate(:page => params[:page])  
    end
  end

  # GET /organizations/1
  def show_participation
  end

  # GET /organizations/new
  def new
    add_breadcrumb "Nuevo Grupo"
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
    add_breadcrumb "Editar Grupo"
  end

  # POST /organizations
  def create
    @organization = Organization.new(organization_params)
    @organization.user = current_user
    if @organization.save
      redirect_to @organization, notice: 'El Grupo fue creado con éxito.'
    else
      render :new
    end
  end

  # PATCH/PUT /organizations/1
  def update
    if @organization.update(organization_params)
      redirect_to @organization, notice: 'El Grupo fue actualizado con éxito.'
    else
      render :edit
    end
  end

  # DELETE /organizations/1
  def destroy
    @organization.destroy
    redirect_to organizations_url, notice: 'El Grupo fue eliminado con éxito.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def organization_params
      params.require(:organization).permit(:name, :address, :phone, :avatar, :user_id)
    end
end
