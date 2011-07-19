class Person < ActiveRecord::Base
  include Mongoid::Document
  acts_as_authentic
  
  # privilege
  CLIENT=10
  ADMIN=90
  
  field :name, type: String
  field :email, type: String
  field :privilege, type: Integer, default: 10
  field :crypted_password, type: String
  field :persistence_token, type: String
  field :single_access_token, type: String
  field :perishable_token, type: String
  
  validates_presence_of :name
  validates_uniqueness_of :email
  
  before_validation :set_password_confirmation
  
  def set_password_confirmation
    self.password_confirmation = self.password
  end
end
