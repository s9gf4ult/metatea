class Tea < ActiveRecord::Base
  attr_accessible :category, :factory, :name

  validates :name, :presence => true
  validates :category, :presence => true

  has_many :tea_pictures, :dependent => :destroy
  has_many :tea_links, :dependent => :destroy
end
