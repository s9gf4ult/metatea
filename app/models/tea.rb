class Tea < ActiveRecord::Base
  attr_accessible :category, :factory, :name, :user_id
  acts_as_commentable

  validates :name, :presence => true
  validates :category, :presence => true
  validates :user_id, :presence => true

  has_many :tea_pictures, :dependent => :destroy
  has_many :tea_links, :dependent => :destroy
  belongs_to :user

  has_many :tea_list_assignments, :dependent => :destroy
  has_many :assign_users, :through => :tea_list_assignments, :source => :user

  has_many :tea_comparsions_as_left, :class_name => "TeaComparsion", :inverse_of => :left_tea, :foreign_key => "left_tea_id", :dependent => :destroy
  has_many :tea_comparsions_as_right, :class_name => "TeaComparsion", :inverse_of => :right_tea, :foreign_key => "right_tea_id", :dependent => :destroy

  has_many :righ_teas, :through => :tea_comparsions_as_left, :source => :right_tea
  has_many :left_teas, :through => :tea_comparsions_as_right, :source => :left_tea

  default_scope { order "created_at DESC" }

  def choose_other_user
    my_user = self.user
    users = self.assign_users.find_all do |u|
      u.id != my_user.id
    end
    users.sample
  end
end
