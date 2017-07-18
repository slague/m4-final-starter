require 'rails_helper'

describe 'A logged in user can mark links as read or unread' do
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

    within('#link-1') do
      expect(page).to have_link("Read")
    end

    within('#link-1') do
      click_on ("Read")
    end
  end
end

# Mark a link as "read" or "unread"
# Create a new link, and see it in added to the top of the list.
#
# There is some JS already written to help you mark a link as read.
#
# Next to each unread link I should see an option to "Mark as Read".
# Clicking this should visibly change the read status to true, and the change should persist.
# Next to each read link I should see an option to "Mark as Unread".
# Clicking this should change the read status to false, and the change should persist.
# Read links should be stylistically differentiated from unread links. You could gray them out or use a strike through or anything you think appropriately informs the user that their link is read or unread.
