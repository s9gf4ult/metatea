class Tea < ActiveRecord::Base
  attr_accessible :category, :factory, :name, :user_id

  validates :name, :presence => true
  validates :category, :presence => true
  validates :user_id, :presence => true

  has_many :tea_pictures, :dependent => :destroy
  has_many :tea_links, :dependent => :destroy
  belongs_to :user
end
