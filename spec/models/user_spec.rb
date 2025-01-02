require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  it "is valid with a name and password" do
    expect(user).to be_valid
  end
  it "is invalid without a name" do
    user.username = nil
    expect(user).to be_invalid
  end
  it "is invalid without a password" do
    user.password_digest = nil
    expect(user).to be_invalid
  end
end
