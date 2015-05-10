class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :avatar => "400x400#", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/img/missing/profile.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :lastname, :presence => true
  validates :name, :presence => true

  def fullname
  	"#{self.name} #{self.lastname}"
  end
end
