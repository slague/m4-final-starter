require 'rails_helper'

RSpec.describe User, type: :model  do
  describe "validations" do
    context "a user is valid with all attributes" do
      it { is_expected.to validate_presence_of(:email)}
      it { is_expected.to validate_presence_of(:password)}
    end
  end

  context "invalid" do
    it "user is invalid without an email" do
      user = User.new(password: "password")

      expect(user).to_not be_valid
    end

    it "user is invalid without a password" do
      user = User.new(email: "email@gmail.com")

      expect(user).to_not be_valid
    end

    it "user is invalid without a unique email" do
      user = User.create(email: "email@gmail.com", password: "password")
      user2 = User.new(email: "email@gmail.com", password: "password")

      expect(user2).to_not be_valid
    end
  end
end
