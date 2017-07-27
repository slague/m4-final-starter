require 'rails_helper'

describe 'A logged in user can filter links' do
  before do
    @user = User.create(name: "Person", password: "123", email: "hi@gmail.com")
    @my_link = @user.links.create(title: "google", url: "https://google.com")
    @my_link2 = @user.links.create(title: "turing", url: "https://turing.io")

    visit login_path

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_on "Login"
  end

    scenario "can filter links" do

      visit links_path

      expect(page).to have_content("Filter Links")
    end

    xscenario "can filter links", js: true do

      visit links_path
      fill_in "Filter Links", with: "Google"
      expect(page).to have_content("google")
      expect(page).to_not have_content("turing")
    end

end
