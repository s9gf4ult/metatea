class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
  validates :name, :presence => true, :uniqueness => true

  has_many :tea_list_assignments, :dependent => :destroy
  has_many :teas
  has_many :assigned_teas, :through => :tea_list_assignments, :source => :tea
  has_many :tea_comparsions, :dependent => :destroy
  has_many :tea_pictures

  def teas_in_list(list_name)
    self.assigned_teas.where("tea_list_assignments.list_name" => list_name)
  end

  def named_tea_assignment(list_name, tea)
    self.tea_list_assignments.where(:list_name => list_name, :tea_id => tea.id).first
  end

  def can_compare?(tea)
    self.named_tea_assignment("tried", tea) ? true : false
  end
end
