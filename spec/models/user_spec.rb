require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:tasks) }

  it "checks the correct full name" do
    user = User.new(:first_name => 'Tom', :last_name => 'Clinton')
    expect(user.full_name).to eq('Tom Clinton')
  end

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }

end
