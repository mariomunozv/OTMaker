class Participation < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	self.per_page = 10

	  		belongs_to :user
	  		belongs_to :organization
	  		belongs_to :estado
		
	# Validations
			validates :user, :presence => true
			validates :organization, :presence => true
			validates :role, :presence => true
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :user, -> (user_name) { where("user.name like ?", "%#{user_name}%") }
		scope :organization, -> (organization_name) { where("organization.name like ?", "%#{organization_name}%") }
		scope :state, -> (state) { where("state like ?", "%#{state}%") }	
end
