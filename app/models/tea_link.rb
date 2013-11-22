class TeaLink < ActiveRecord::Base
  attr_accessible :link, :tea_id

  validates :tea_id, :presence => true
  validates :link, :presence => true, :uniqueness => {:scope => :tea_id}
  belongs_to :tea
end
