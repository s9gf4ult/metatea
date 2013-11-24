class TeaComparsion < ActiveRecord::Base
  attr_accessible :axis_name, :left_tea_id, :result, :right_tea_id, :user_id

  validates :user_id, :presence => true
  validates :axis_name, :presence => true
  validates :result, :presence => true
  validates :left_tea_id, :presence => true
  validates :right_tea_id, :presence => true
  validate :backward_comparsion_doesnt_exists, :different_teas

  belongs_to :user
  belongs_to :left_tea, :class_name => "Tea", :foreign_key => "left_tea_id"
  belongs_to :right_tea, :class_name => "Tea", :foreign_key => "right_tea_id"

  protected

  def backward_comparsion_doesnt_exists
    if TeaComparsion.where(:user_id => self.user.id,
                           :axis_name => self.axis_name,
                           :left_tea_id => self.right_tea.id,
                           :right_tea_id => self.left_tea.id).first ||
        TeaComparsion.where(:user_id => self.user.id,
                            :axis_name => self.axis_name,
                            :left_tea_id => self.left_tea.id,
                            :right_tea_id => self.right_tea.id).first
      errors.add(:axis_name, "This two tea is already compared by this axis")
    end
  end

  def different_teas
    if self.left_tea.id == self.right_tea.id
      errors.add(:left_tea_id, "Must not be the same tea as right")
    end
  end

end
