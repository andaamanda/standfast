class User
  include Mongoid::Document
  include Clearance::User
  
  # privilege
  CLIENT=10
  ADMIN=90
  
  field :name, type: String
  # authentication
  field :email, type: String
  field :encrypted_password, :type => String
  field :salt, :type => String
  field :confirmation_token, :type => String
  field :remember_token, :type => String
  # authorization
  field :privilege, type: Integer, default: 10
  
  validates_presence_of :name
  validates_uniqueness_of :email
  
  # clearance methods
  def self.find_by_email(email)
    where(:email => email).first
  end
  
  def self.find_by_remember_token(token)
    where(:remember_token => token).first
  end
end
