class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :tea_list_assignments, :dependent => :destroy
  has_many :teas, :through => :tea_list_assignments

  def teas_in_list(list_name)
    self.teas.where("tea_list_assignments.list_name" => list_name)
  end

  def named_tea_assignment(list_name, tea)
    self.tea_list_assignments.where(:list_name => list_name, :tea_id => tea.id).first
  end
end
