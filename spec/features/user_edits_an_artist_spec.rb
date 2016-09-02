require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "User sees updated name and image for artist" do
    artist = Artist.create!(name: "Michael Jackson", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    
    visit artist_path(artist)
    
    click_on "Edit"
    fill_in "artist_name", with: "Bob Marley"
    fill_in "artist_image_path", with: "bob_marley.jpg"
    click_on "Update Artist"
    
    expect(page).to have_content "Bob Marley"
    expect(page).to have_css("img[src*='bob_marley.jpg']")
  end
end