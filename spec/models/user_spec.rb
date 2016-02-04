require 'rails_helper'

RSpec.describe User, type: :model do
  it "checks the correct full name" do
    user = User.new(:first_name => 'Tom', :last_name => 'Clinton')
    expect(user.full_name).to eq('Tom Clinton')
  end


end
