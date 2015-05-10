class Notification < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	self.per_page = 10

	  		belongs_to :user
	  		belongs_to :work_order
	  		belongs_to :notification_type
		
	# Validations
			validates :user, :presence => true
			validates :work_order, :presence => true
			validates :detail, :presence => true
			# validates :status, <validations>
			validates :notification_type, :presence => true
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :user, -> (user_name) { where("user.name like ?", "%#{user_name}%") }
		scope :work_order, -> (work_order_name) { where("work_order.name like ?", "%#{work_order_name}%") }
		scope :detail, -> (detail) { where detail: detail }
		scope :status, -> (status) { where status: status }
		scope :notification_type, -> (notification_type_name) { where("notification_type.name like ?", "%#{notification_type_name}%") }
	
end
