class Task < ActiveRecord::Base
  PRIORITY = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  STATUS = %w(Inactive Active Completed)

  belongs_to :user

  validates_presence_of :title, :description, :priority, :due_date, :user_id, :status
  validate :future_data
  validate :check_priority
  validate :check_status

  def check_priority
    if PRIORITY.include?(priority)
      true
    else
      errors.add(:priority, "Incorrect value #{priority}")
    end
  end

  def check_status
    if STATUS.include?(status)
      true
    else
      errors.add(:status, "Incorrect value #{status}")
    end
  end

  def future_data
    errors.add(:due_date, 'can not be in the past') if
      !due_date.blank? and due_date < Time.now
  end

  scope :active, -> { where(status: 'Active')}
  scope :completed, -> { where(status: 'Completed')}
  scope :inactive, -> { where(status: 'Inactive')}
end
