require 'rails_helper'

RSpec.describe Link, type: :model  do
  describe "validations" do
    context "a link is valid with all attributes" do
      it { should validate_presence_of(:url) }
    end
  end
end

  context "invalid" do
    it "link is invalid without a url" do
      link = Link.new()
      expect(link).to_not be_valid
    end
  end

  describe "attributes" do

    it "responds to title, created_at, updated_at, user" do
      link = Link.create(title: "Google", url: "https://google.com")
      expect(link).to respond_to(:title, :created_at, :updated_at, :user, :read)
    end
end
