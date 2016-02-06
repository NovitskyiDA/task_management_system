class Task < ActiveRecord::Base
  STATUS = %w(Inactive Active Completed)

  belongs_to :user

  validates_presence_of :title, :description, :priority, :due_date, :user_id, :status
  validate :future_data
  validate :check_status
  validates_inclusion_of :priority, :in => 1..100

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
