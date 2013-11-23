class TeaListAssignment < ActiveRecord::Base
  attr_accessible :list_name, :tea_id, :user_id

  belongs_to :user
  belongs_to :tea

  validates :list_name, :presence => true
  validates :tea_id, :presence => true
  validates :user_id, :presence => true, :uniqueness => {:scope => [:tea_id, :list_name]}
end
