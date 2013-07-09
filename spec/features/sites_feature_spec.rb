require 'spec_helper'

describe "Listing and browsing sites", type: :feature do
  let(:domain) { "somedomain.com" }
  let!(:site) { Site.create! domain: domain }
  let!(:bookmark1) { create_bookmark url: "http://#{domain}/fun" }
  let!(:bookmark2) { create_bookmark url: "http://#{domain}/games" }

  it "should list all sites" do
    visit "/sites"
    expect(page).to have_content domain
  end

  it "should show site with all it's bookmarks" do
    visit "/sites"
    click_link domain
    expect(page).to have_content "/fun"
    expect(page).to have_content "/games"
  end
end
