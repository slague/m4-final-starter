require 'rails_helper'

describe 'A registered user that is NOT logged in visits root' do
  before do
    @user = User.create(name: "Person", password: "123", email: "hi@gmail.com")
    @my_link = @user.links.create(title: "First Link", url: "https://google.com", read: true)
  end

  scenario "is redirected to home page to log in" do
    visit root_path

    expect(current_path).to eq('/home')
    expect(page).to have_link('Sign Up')
    expect(page).to have_link('Login')
  end

  scenario "visits login page and fills in correct email and password" do
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password

    click_on "Login"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Signed with #{@user.email} account")
    expect(page).to have_content("Logout")
    expect(page).to have_content(@my_link)
  end
end





#
# Sign In
#
# As a registered user, when I attempt to sign in, I receive a flash message to reflect a successful or unsuccessful log in attempt.
#
# Sign Out
#
# As an authenticated user viewing the index page, I should see a link to "Sign Out" and not see a link to "Sign In". This "Sign Out" link should redirect me back to the page that prompts me to "Log In or Sign Up".
