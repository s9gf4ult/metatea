class Tea < ActiveRecord::Base
  attr_accessible :category, :factory, :name

  validates :name, :presence => true
  validates :category, :presence => true
end
