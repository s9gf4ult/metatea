class Tea < ActiveRecord::Base
  attr_accessible :category, :factory, :name

  validates :name, :presence => true
  validates :category, :presence => true

  has_many :tea_pictures
  has_many :tea_links
end
