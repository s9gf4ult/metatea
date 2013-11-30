class TeaPicture < ActiveRecord::Base
  attr_accessible :tea_id, :picture, :user_id

  validates :tea_id, :presence => true
  validates :user_id, :presence => true

  belongs_to :tea
  belongs_to :user

  has_attached_file :picture, :styles => {:small => "50x50>", :medium => "300x300>"}

  default_scope { order "created_at DESC" }
end
