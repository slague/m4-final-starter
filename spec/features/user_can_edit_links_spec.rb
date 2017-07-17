require 'rails_helper'

describe 'A logged in user can edit links' do
  before do
    @user = User.create(name: "Person", password: "123", email: "hi@gmail.com")
    @my_link = @user.links.create(title: "google", url: "https://google.com")

    visit login_path

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_on "Login"
  end

  scenario "a logged can make edits to a link, edits are saved" do

    visit links_path

    within('#link-1') do
      expect(page).to have_link("Edit link")
    end

    within('#link-1') do
      click_on ("Edit link")
    end

    expect(current_path).to eq(edit_link_path(@my_link))

    fill_in "Title", with: "Turing"
    fill_in "Url", with: "https://turing.io"
    click_on "Update Link"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Turing")
    expect(page).to have_content("https://turing.io")
  end

end
