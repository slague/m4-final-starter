require('rail')

require 'rails_helper'

describe 'A logged in user can submit and view links' do
  before do
    @user = User.create(name: "Person", password: "123", email: "hi@gmail.com")
    visit login_path

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_on "Login"
  end

  scenario "a logged in user sees a form to add a link on the links index page" do
    # As an authenticated user viewing the main page (links#index), I should see a simple form to submit a link.
    #
    # A link includes:
    #
    # A valid URL for the link
    # Hint: You can use Ruby's built in URI.parse method to determine if a link is a valid or not. This StackOverflow post has more information. Alternatively, you could use a gem like this one.
    #
    # A title for the link
    #
    # A read status that is either true or false.___ NOT PART OF FROM- DEFAULT TO FALSE
  end

  scenario "a link with a valid url and title can be added to a user's list of links" do
    # create (fill out form and submit)
    # Once a link has been submitted, loading the index page should display all of my links only.
  end
  scenario "a link's default read status is false" do

  end
  scenario "a link with an invalid url cannot be added to a user's list of links" do
    # Submitting an invalid link should result in an error message being displayed that indicated why the user was not able to add the link.
  end

end
