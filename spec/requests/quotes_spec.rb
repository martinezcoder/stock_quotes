require 'rails_helper'

RSpec.describe "Quotes", :type => :request do
  describe "GET /quotes" do
    it "works! (now write some real specs)" do
      get quotes_path
      expect(response.status).to be(200)
    end
  end
end

describe "Quotes" do
  describe "list" do
    it "should have the content 'Listing quotes'" do
      visit '/quotes'
      expect(page).to have_content("Listing quotes")
    end
  end
end
