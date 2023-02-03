require 'rails_helper'

RSpec.describe 'Artist Page' do
  describe "Artist Show" do
    let!(:artist_1) { Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
    let!(:artist_2) { Artist.create(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
    let!(:artist_3) { Artist.create(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }
    let!(:work_1) { Work.create!(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id) }
    let!(:work_2) { Work.create(title: 'Violon dIngres', available_for_purchase: false, artist_id: artist_1.id) }
    
    # User Story 2, Parent Show 

    # As a visitor
    # When I visit '/parents/:id'
    # Then I see the parent with that id including the parent's attributes
    describe 'As a visitor' do
      describe 'When I visit /artists/:id' do
        it 'Then I see the artist with that id including the artists attributes' do
          visit "/artists/#{artist_1.id}"
      
          expect(page).to have_content(artist_1.name)
          expect(page).to have_content(artist_1.city)
          expect(page).to have_content(artist_1.alive_today)
        end
      end
    end
  end
end
