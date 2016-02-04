class Task < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :description, :user_id
  validate :future_data
  validate :priority_status

  def priority_status
    status = [0, 1, 2]
    if status.include?(priority)
      true
    else
      errors.add(:priority, "Incorrect value #{priority}")
    end
  end

  def future_data
    errors.add(:due_date, 'can not be in the past') if
      !due_date.blank? and due_date < Time.now
  end

  def status
    if priority == 1
      'active'
    elsif priority == 2
      'completed'
    elsif priority == 0
      'inactive'
    end
  end

  scope :active, -> { where(priority: 1)}
  scope :completed, -> { where(priority: 2)}
  scope :inactive, -> { where(priority: 0)}
end
