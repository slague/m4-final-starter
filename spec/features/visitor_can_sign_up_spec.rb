require 'rails_helper'

describe 'Visitor visits links index' do
  before do
    @user = User.new(name: "Person", password: "123", email: "hello@gmail.com")
    @user3 = User.create(name: "Dude", password: "987", email: "hi@gmail.com")
    @user2 = User.new(name: "Another person", password: "321", email: "hi@gmail.com")
    @user4 = User.new(name: "Hey!", password: '5678', email: "hey@gmail.com")
  end

  scenario 'and is redirected to sign up' do
    visit root_path
    expect(current_path).to eq('/home')
    expect(page).to have_link('Sign Up')
    expect(page).to have_link('Login')
  end

  scenario "and clicks sign up link there is a form to register as a new user" do
    visit root_path

    click_on('Sign Up')

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content('Sign up for a new account')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_content('Password confirmation')
  end


  scenario "and fills in personal information" do
    visit new_user_path

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password
    click_on "Create User"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Successfully created account with email, #{@user.email}")
  end

  scenario "new user cannot register with already-used email address" do

    visit new_user_path

    fill_in "Email", with: @user2.email
    fill_in "Password", with: @user2.password
    fill_in "Password confirmation", with: @user2.password

    click_on "Create User"

    expect(page).to have_content("Sorry, but that email has already been taken.")
  end

  scenario "new user cannot register without a password" do

    visit new_user_path

    fill_in "Email", with: @user4.email

    click_on "Create User"

    expect(page).to have_content("You must include a password in order to register.")
  end

  scenario "new user cannot register without an email" do

    visit new_user_path

    fill_in "Password", with: @user4.password
    fill_in "Password confirmation", with: @user4.password

    click_on "Create User"

    expect(page).to have_content("You must include an email in order to register.")
  end

  scenario "password and password confirmation must match" do

    visit new_user_path

    fill_in "Email", with: @user4.email
    fill_in "Password", with: @user4.password
    fill_in "Password confirmation", with: '6789'

    click_on "Create User"

    expect(page).to have_content("Password and confirmation must match in order to register.")
  end
end
