require 'spec_helper'

describe Bookmark do

  let!(:site) { Site.create! domain: "google.com" }

  it "should create new site if it doesn't exist" do
    expect do
      Bookmark.create! url: "http://example.com"
    end.to change { Site.count }.by(1)
  end

  it "should assign an existing site if it matches the domain" do
    bookmark = Bookmark.create! url: "http://google.com/reader"
    expect(bookmark.site).to eq(site)
  end

  it "matches the correct domain with either protocol" do
    bookmark = Bookmark.create! url: "https://google.com/gmail"
    expect(bookmark.site).to eq(site)
  end

end
