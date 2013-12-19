class TeaPicture < ActiveRecord::Base
  attr_accessible :tea_id, :picture, :user_id

  validates :tea_id, :presence => true
  validates :user_id, :presence => true
  validates_attachment(:picture,
                       :presence => true,
                       :size => {:in => 0..2.megabytes})

  belongs_to :tea
  belongs_to :user

  has_attached_file(:picture,
                    :styles => {:small => ["50x50>", :png],
                                :medium => ["150x150>", :png],
                                :big => ["300x300>", :png]})

  default_scope { order "created_at ASC" }
end
