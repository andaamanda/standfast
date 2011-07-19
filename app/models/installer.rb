class Installer
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :contact, type: String
  field :phone, type: String
  field :address, type: String
  field :notes, type: String
  field :installer, type: Boolean
  field :distributor, type: Boolean
  
  validates_presence_of :name, :phone, :address
end
