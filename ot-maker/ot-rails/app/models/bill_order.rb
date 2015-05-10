class BillOrder < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	self.per_page = 10

		
	# Validations
			validates :folio, :presence => true
			# validates :issued, <validations>
			# validates :status, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :folio, -> (folio) { where folio: folio }
		scope :issued, -> (issued) { where issued: issued }
		scope :status, -> (status) { where status: status }
	
end
