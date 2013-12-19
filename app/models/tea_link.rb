class TeaLink < ActiveRecord::Base
  attr_accessible :link, :tea_id, :user_id

  validates :tea_id, :presence => true
  validates :link, :presence => true, :uniqueness => {:scope => :tea_id}
  validates :user_id, :presence => true
  validate :validate_url

  belongs_to :tea
  belongs_to :user

  default_scope { order "created_at DESC" }

  private

  def validate_url
    u = URI.parse(self.link)
    puts u
    ['http', 'https'].include? u.scheme
  rescue URI::BadURIError
    errors.add(:link, "Link is not valid")
  rescue URI::InvalidURIError
    errors.add(:link, "Link is not valid")
  end
end
