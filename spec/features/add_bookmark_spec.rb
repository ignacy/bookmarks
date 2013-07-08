require 'spec_helper'

describe "Adding new bookmark", type: :feature do
  it "works when we enter a URL and tags" do
    expect do
      visit '/bookmarks/new'
      fill_in 'URL', with: 'http://example.com'
      fill_in 'Tags (separated by commas)', with: 'important'
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
end
