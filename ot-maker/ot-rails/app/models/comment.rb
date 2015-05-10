class Comment < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	self.per_page = 10

	  		belongs_to :work_order
	  		belongs_to :user
		
	# Validations
			validates :work_order, :presence => true
			validates :user, :presence => true
			validates :content, :presence => true
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :work_order, -> (work_order_name) { where("work_order.name like ?", "%#{work_order_name}%") }
		scope :user, -> (user_name) { where("user.name like ?", "%#{user_name}%") }
		scope :content, -> (content) { where content: content }
	
end
