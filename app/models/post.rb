class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :content, type: String
  field :slug, type: String
  embeds_one :user
  
  before_validation :set_slug
  validates_uniqueness_of :slug
  validates_presence_of :title, :content
  
  def set_slug
    self.slug = PermalinkFu.escape(self.title || '') if self.slug.blank?
  end
end
