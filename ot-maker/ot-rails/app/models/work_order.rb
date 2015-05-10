class WorkOrder < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	self.per_page = 10

	  		belongs_to :user
	  		belongs_to :user_assigned, :class_name => 'User', :foreign_key => 'user_assigned_id'
	  		belongs_to :organization
	  		belongs_to :organization_assigned, :class_name => 'Organization', :foreign_key => 'organization_assigned_id'
	  		belongs_to :bill_order
		
	# Validations
			validates :code, :presence => true
			validates :title, :presence => true
			# validates :description, :presence => true
			validates :user, :presence => true
			validates :state, :presence => true
			# validates :user_assigned, :presence => true
			validates :organization_assigned_id, :presence => true
			# validates :bill_order, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :code, -> (code) { where code: code }
		scope :title, -> (title) { where title: title }
		scope :description, -> (description) { where description: description }
		scope :user, -> (user_name) { where("user.name like ?", "%#{user_name}%") }
		scope :organization, -> (organization_name) { where("organization.name like ?", "%#{organization_name}%") }
		scope :bill_order, -> (bill_order_folio) { where("bill_order.folio like ?", "%#{bill_order_folio}%") }
		# TRUCO SUCIO falta agrgar lineas de atributos nuevos


	def show_state
		if self.state==1
          	return "Pendiente"
        elsif self.state==4
      		return "Facturado"
      	elsif self.state == 3
          	return "Aceptado"
        elsif self.state==6
          	return "Rechazado"
        end
	end
	
end
