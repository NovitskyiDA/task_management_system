class Task < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :user_id
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
    errors.add(:due_date, "can't be in the past") if
        !due_date.blank? and due_date < Time.now
  end

end
