require 'spec_helper'

describe "Listing and browsing sites", type: :feature do
  let!(:site) { Site.create! domain: "somename.com" }

  it "should list all sites" do
    visit "/sites"
    expect(page).to have_content "somename.com"
  end

end
