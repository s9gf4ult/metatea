class Tea < ActiveRecord::Base
  attr_accessible :category, :factory, :name, :user_id

  validates :name, :presence => true
  validates :category, :presence => true
  validates :user_id, :presence => true

  has_many :tea_pictures, :dependent => :destroy
  has_many :tea_links, :dependent => :destroy
  belongs_to :user

  has_many :tea_list_assignments, :dependent => :destroy
  has_many :users, :through => :tea_list_assignments

  has_many :tea_comparsions_as_left, :class_name => "TeaComparsion", :inverse_of => :left_tea, :foreign_key => "left_tea_id"
  has_many :tea_comparsions_as_right, :class_name => "TeaComparsion", :inverse_of => :right_tea, :foreign_key => "right_tea_id"

  has_many :righ_teas, :through => :tea_comparsions_as_left, :source => :right_tea
  has_many :left_teas, :through => :tea_comparsions_as_right, :source => :left_tea
end
