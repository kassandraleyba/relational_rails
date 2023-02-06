
require 'rails_helper'

RSpec.describe 'Artist Page' do
  describe "Artist Edit" do
    let!(:artist_1) { Artist.create!(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
    let!(:artist_2) { Artist.create!(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
    let!(:artist_3) { Artist.create!(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }
    let!(:work_1) { Work.create!(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id) }
    let!(:work_2) { Work.create!(title: 'Violon dIngres', available_for_purchase: false, artist_id: artist_1.id) }   
  
    # User Story 12, Parent Update 

    # As a visitor
    # When I visit a parent show page
    # Then I see a link to update the parent "Update Parent"
    # When I click the link "Update Parent"
    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
    # When I fill out the form with updated information
    # And I click the button to submit the form
    # Then a `PATCH` request is sent to '/parents/:id',
    # the parent's info is updated,
    # and I am redirected to the Parent's Show page where I see the parent's updated info

    describe 'As a visitor' do
      describe 'When I visit a artist show page' do
        describe 'Then I see a link to update the artist "Update Artist"' do
          describe 'Then I am taken to /artists/:id/edit where I  see a form to edit the artists attributes:' do
            it 'and I am redirected to the Artists Show page where I see the artists updated info' do
              visit "/artists"
              
              click_button("Edit #{artist_1.name}")
              # click_button("Edit")
              
              expect(current_path).to eq("/artists/#{artist_1.id}/edit")
            end
          end
        end
      end
    end

    it 'can edit the artist' do
      artist_4 = Artist.create!(name: 'Ansel Adams', city: 'San Fransisco', alive_today: false, created_at: Time.now + 1.hour)
  
      visit "/artists"
  
      expect(page).to have_content("Ansel Adam")
  
      click_button "Edit Ansel Adam"
      # click_button "Edit"
  
      fill_in "Name", with: "Ansel Adams"
      click_button "Update Artist"
  
      expect(current_path).to eq("/artists")
      expect(page).to have_content("Ansel Adams")
    end
  end
end