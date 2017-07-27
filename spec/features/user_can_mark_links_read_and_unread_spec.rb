require 'rails_helper'

describe 'A logged in user can mark links as read or unread', js: true do
  before do
    @user = User.create(name: "Person", password: "123", email: "hi@gmail.com")
    @my_link = @user.links.create(title: "google", url: "https://google.com")
    @my_link2 = @user.links.create(title: "turing", url: "https://turing.io")

    visit login_path

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_on "Login"
  end

    scenario "a can mark a link as read" do

      visit links_path

      expect(page).to have_link("Mark read")
      expect(page).to_not have_link("Mark unread")
      end

    scenario "a can mark a link as read" do

      visit links_path

      # save_and_open_page
    within(:css, "div#link-#{@my_link.id}") do
      click_on "Mark read"
    end

    expect(page).to have_link("Mark unread")
  end

end
