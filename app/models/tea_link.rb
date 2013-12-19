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
    def invalid_link
      errors.add(:link, "Link is not valid")
    end

    u = URI.parse(self.link)
    unless ['http', 'https'].include? u.scheme
      invalid_link
    end
  rescue URI::BadURIError
    invalid_link
  rescue URI::InvalidURIError
    invalid_link
  end
end
