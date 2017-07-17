require 'rails_helper'

describe 'A registered user that is NOT logged in visits root' do
  before do
    @user = User.create(name: "Person", password: "123", email: "hi@gmail.com")
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

    click_on "Login"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Signed with #{@user.email} account")
    expect(page).to have_content("Logout")
  end

  scenario "cannot log in with incorrect email-passoword combination" do
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: '456'

    click_on "Login"

    expect(page).to have_content("Incorrect email and password combination.")
  end

  scenario "cannot log in with unregistered email" do
    visit login_path
    fill_in "Email", with: 'anewemail@gmail.com'
    fill_in "Password", with: '456'

    click_on "Login"

    expect(page).to have_content("No account registered with that email. Please sign up.")
  end
end
