class IndexController < ApplicationController
  
  add_breadcrumb "Dashboard", :root_path

  def home
  	@work_orders = WorkOrder.order('updated_at DESC').paginate(:page => params[:page])
  	@organizations = Organization.where(user:current_user).order('updated_at DESC').paginate(:page => params[:porg])
  end
end
