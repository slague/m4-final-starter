require 'rails_helper'

describe 'Visitor visits links index' do

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

end



#
# I cannot sign up with an email address that has already been used.
# I cannot sign up without an email address and a password.
# Password and confirmation must match.
# If criteria is not met the user should be given a message to reflect the reason they could not sign up.
# Upon submitting this information, I should be logged in and redirected to the "Links Index" page.
#
# Sign In
#
# As a registered user, when I attempt to sign in, I receive a flash message to reflect a successful or unsuccessful log in attempt.
#
# Sign Out
#
# As an authenticated user viewing the index page, I should see a link to "Sign Out" and not see a link to "Sign In". This "Sign Out" link should redirect me back to the page that prompts me to "Log In or Sign Up".
