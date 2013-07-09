require 'spec_helper'

describe "Searching for stuff", type: :feature do
  let(:simulated_website) { SimulatedBookmarksSite.new }

  let!(:bookmark) { create_bookmark url: "http://coolstuff.com"}
  let!(:site) { Site.create! domain: "coolstuff.com" }

  it "should find bookmark and site matching a domain" do
    visit "/bookmarks"
    fill_in "q", with: "coolstuff"
    click_button "Go"
    expect(page).to have_content "Site: coolstuff.com"
    expect(page).to have_content "Bookmark: http://coolstuff.com/TITLE"
  end

  it "should find bookmarks matching a unique text" do
    visit "/bookmarks"
    fill_in "q", with: "TITLE"
    click_button "Go"
    expect(page).to have_content "Bookmark: http://coolstuff.com/TITLE"
    expect(page).not_to have_content "Site: coolstuff.com"
  end
end
