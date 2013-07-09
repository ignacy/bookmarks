require 'spec_helper'

describe "Adding new bookmark and removing it", type: :feature do
  let(:simulated_website) { SimulatedBookmarksSite.new }

  it "works when we enter a URL and tags" do
    expect do
      visit '/bookmarks/new'
      fill_in 'URL', with: 'http://example.com'
      fill_in 'Tags', with: 'important'
      click_button 'Create Bookmark'
    end.to change { Bookmark.count }.by(1)
  end

  it "works with URL only (no tags)" do
    expect do
      visit '/bookmarks/new'
      fill_in 'URL', with: 'http://example.com'
      click_button 'Create Bookmark'
    end.to change { Bookmark.count }.by(1)
  end

  it "does not work without URL" do
    visit '/bookmarks/new'
    click_button 'Create Bookmark'
    expect(page).to have_content "Url can't be blank"
  end

  it "allows users to remove bookmarks", js: true do
    bookmark = Bookmark.create! url: "http://google.com/djhdjd"
    expect do
      visit "/bookmarks/#{bookmark.id}"
      simulated_website.accept_next_confirmation
      click_button "Remove bookmark"
      visit "/bookmarks"
    end.to change { Bookmark.count }.by(-1)
  end
end
