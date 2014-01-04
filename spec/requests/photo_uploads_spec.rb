require 'spec_helper'

describe "PhotoUploads" do
  describe "GET /photo_uploads" do
    it "shows the word 'wow' on upload page" do
      visit new_photo_path
      page.should have_content('secret')
    end
  end
end
