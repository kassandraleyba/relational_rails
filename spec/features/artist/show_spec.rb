require 'rails_helper'

RSpec.describe 'Artist Page' do
  describe "Artist Show" do
    
    # User Story 2, Parent Show 

    # As a visitor
    # When I visit '/parents/:id'
    # Then I see the parent with that id including the parent's attributes
    describe 'As a visitor' do
      describe 'When I visit /artists/:id' do
        it 'Then I see the artist with that id including the artists attributes' do
          artist_1 = Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false)
      
          visit "/artists/#{artist_1.id}"
      
          expect(page).to have_content(artist_1.name)
          expect(page).to have_content(artist_1.city)
          expect(page).to have_content(artist_1.alive_today)
        end
      end
    end
  end
end