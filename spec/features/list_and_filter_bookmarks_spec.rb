require 'spec_helper'

describe "Listing bookmarks by tag", type: :feature do
  let!(:bookmark1) { create_bookmark(tag_list: "books", url: "http://example.com/1") }
  let!(:bookmark2) { create_bookmark(tag_list: "code", url: "http://example.com/2") }

  it "shows all bookmarks matching a tag" do
    visit "/bookmarks"
    expect(page).to have_content "http://example.com/1"
    expect(page).to have_content "http://example.com/2"
    click_link "books"
    expect(page).to have_content "http://example.com/1"
    expect(page).not_to have_content "http://example.com/2"
  end
end
