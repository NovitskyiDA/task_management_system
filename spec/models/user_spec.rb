require 'rails_helper'

RSpec.describe User, type: :model do
  it "checks the correct full name" do
    user = User.new(:first_name => 'Tom', :last_name => 'Clinton')
    expect(user.full_name).to eq('Tom Clinton')
  end

  # it "requires a first name" do
  #   user = User.create(:first_name => nil, :last_name => 'Clinton', :email => 'example@mail.ua')
  #   expect(user.errors.full_messages[0]).to eq("First name can't be blank")
  # end
end
