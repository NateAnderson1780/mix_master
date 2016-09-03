require 'rails_helper'

RSpec.feature "User creates a song" do
  scenario "view the song and have a link to artist after creation" do 
    artist = Artist.create!(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    
    visit artist_path(artist)
    
    click_on "New Song"
    fill_in "song_title", with: "Trenchtown Rock"
    click_on "Create Song"
    
    expect(page).to have_content "Trenchtown Rock"
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end