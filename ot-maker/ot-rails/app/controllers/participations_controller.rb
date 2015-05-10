class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy]

  # GET /participations
  def index
    @participations = Participation.where(user:current_user).paginate(:page => params[:page])
  end

  # GET /participations/1
  def show
  end

  # GET /participations/new
  def new
    @organization = Organization.where(id:params[:id])[0] #truco sucio, debe haber forma de traer solo 1
    @participation = Participation.new
  end

  # GET /participations/1/edit
  def edit
  end

  # POST /participations
  def create
    @participation = Participation.new(participation_params)
    @participation.state = 0
    if @participation.save
      redirect_to @participation.organization, notice: "Se ha agregado a #{@participation.user.name} como participante."
    else
      @organization = @participation.organization
      render :new
    end
  end

  # PATCH/PUT /participations/1
  def update
    @participation.state = 1;
    if @participation.update(participation_params)
      redirect_to participations_path, notice: 'Se ha aceptado la participacion a la organización.'
    else
      render :edit
    end
  end

  # DELETE /participations/1
  def destroy
    @participation.destroy
    redirect_to participations_url, notice: 'Participation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def participation_params
      params.require(:participation).permit(:user_id, :organization_id, :role)
    end
end
