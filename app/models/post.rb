class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :article, type: String
  embeds_one :user
  
  validates_presence_of :title, :article
end
