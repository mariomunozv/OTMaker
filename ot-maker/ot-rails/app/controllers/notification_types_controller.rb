class NotificationTypesController < ApplicationController
  before_action :set_notification_type, only: [:show, :edit, :update, :destroy]

  # GET /notification_types
  def index
    @notification_types = NotificationType.paginate(:page => params[:page])
  end

  # GET /notification_types/1
  def show
  end

  # GET /notification_types/new
  def new
    @notification_type = NotificationType.new
  end

  # GET /notification_types/1/edit
  def edit
  end

  # POST /notification_types
  def create
    @notification_type = NotificationType.new(notification_type_params)

    if @notification_type.save
      redirect_to @notification_type, notice: 'Notification type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /notification_types/1
  def update
    if @notification_type.update(notification_type_params)
      redirect_to @notification_type, notice: 'Notification type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /notification_types/1
  def destroy
    @notification_type.destroy
    redirect_to notification_types_url, notice: 'Notification type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_type
      @notification_type = NotificationType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notification_type_params
      params.require(:notification_type).permit(:name, :template)
    end
end
