class TeaLink < ActiveRecord::Base
  attr_accessible :link, :tea_id, :user_id

  validates :tea_id, :presence => true
  validates :link, :presence => true, :uniqueness => {:scope => :tea_id}
  validates :user_id, :presence => true
  belongs_to :tea
  belongs_to :user
end
