class TeaPicture < ActiveRecord::Base
  attr_accessible :tea_id, :picture

  validates :tea_id, :presence => true

  belongs_to :tea

  has_attached_file :picture, :styles => {:small => "50x50>", :medium => "300x300>"}
end
