require 'rails_helper'

RSpec.describe Task, type: :model do

  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:due_date) }
  it { should validate_presence_of(:user_id) }


  it 'does not allow any priority expect 0, 1, 2' do
    task = Task.new(
        title: 'title',
        description: 'description',
        due_date: Date.tomorrow,
        priority: 3,
        user_id: 1
    )
    task.valid?
    expect(task.errors[:priority].size).to eq(1)
  end

  it 'does not allow due date in the past' do
    task = Task.new(
        title: 'title',
        description: 'description',
        due_date: Date.yesterday,
        priority: 3,
        user_id: 1
    )
    task.valid?
    expect(task.errors[:due_date].size).to eq(1)
  end
end
