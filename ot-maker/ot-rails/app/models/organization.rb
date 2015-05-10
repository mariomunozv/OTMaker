class Organization < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	self.per_page = 10

	belongs_to :user
		
	has_attached_file :avatar, :styles => { :avatar => "400x400#", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/img/missing/image.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	# Validations
	validates :name, :presence => true
	validates :address, :presence => true
	validates :phone, :presence => true
	validates :user, :presence => true
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
	scope :byname, -> (name) { where("name like ?", "%#{name}%") }
	scope :address, -> (address) { where address: address }
	scope :phone, -> (phone) { where phone: phone }
	scope :user, -> (user_name) { where("user.name like ?", "%#{user_name}%") }
	
end
