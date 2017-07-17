require 'rails_helper'

describe 'A logged in user' do
  before do
    @user = User.create(name: "Person", password: "123", email: "hi@gmail.com")
    visit login_path

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_on "Login"
  end

  scenario "can log out and is redirected to the home page" do

    expect(current_path).to eq(links_path)
    expect(page).to have_link("Logout")

    click_on 'Logout'

    expect(current_path).to eq('/home')
    expect(page).to_not have_content("#{@user.email}")
  end
end
