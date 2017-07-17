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

    visit links_path

    expect(page).to have_content("Add a new link to your list")
    expect(page).to have_content("Title")
    expect(page).to have_content("Url")
  end

  scenario "a link with a valid url and title can be added to a user's list of links" do
    visit links_path

    fill_in "Title", with: "Google"
    fill_in "Url", with: "https://google.com"

    click_on "Create Link"

    expect(@user.links.length).to eq(1)
    expect(@user.links.first.title).to eq("Google")
    expect(@user.links.first.url).to eq("https://google.com")
    expect(page).to have_content("Google")
    expect(page).to have_content("https://google.com")
  end

  scenario "a link's default read status is false" do
    fill_in "Title", with: "Google"
    fill_in "Url", with: "https://google.com"

    click_on "Create Link"

    expect(@user.links.first.read).to eq(false)
    expect(page).to have_content("false")
  end

  scenario "a link with an invalid url cannot be added to a user's list of links" do
    visit links_path

    fill_in "Title", with: "Google"
    fill_in "Url", with: "google"

    click_on "Create Link"

# Bug! This is coming in as an alert via the ajax call... it is not createing, but error is an alert
    expect(page).to have_content("Not a valid url.")
  end

end
