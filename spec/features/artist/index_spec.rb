require 'rails_helper'

RSpec.describe 'Artist Page' do
  describe "Artist Index" do
    let!(:artist_1) { Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
    let!(:artist_2) { Artist.create(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
    let!(:artist_3) { Artist.create(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }
    let!(:work_1) { Work.create!(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id) }
    let!(:work_2) { Work.create(title: 'Violon dIngres', available_for_purchase: false, artist_id: artist_1.id) }
    
    # User Story 1, Parent Index 
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    describe "As a visitor" do
      describe "When I visit '/artists'" do
        it 'Then I see the name of each artist record in the system' do
          visit "/artists"
      
          expect(page).to have_content(artist_1.name)
          expect(page).to have_content(artist_2.name)
          expect(page).to have_content(artist_2.name)
        end
      end
    end

    # User Story 6, Parent Index sorted by Most Recently Created 

    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created

    describe 'As a visitor' do
      scenario 'When I visit /artists I see when it was created' do
        visit "/artists"

        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.name)
        expect(artist_3.name).to appear_before(artist_1.name)
        expect(artist_1.name).to appear_before(artist_2.name)
        expect(page).to have_content(artist_1.created_at)
        expect(page).to have_content(artist_2.created_at)
        expect(page).to have_content(artist_3.created_at)
      end
    end

    # User Story 9, Parent Index Link

    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index

    describe "As a visitor" do
      describe "When I visit any page on the site" do
        it 'Then I see a link at the top of the page that takes me to the Parent Index' do
          visit "/artists"
      
          click_link('Artists')
          #after click_link - ALWAYS visit /works
          
          expect(current_path).to eq('/artists')
        end
      end
    end

    # User Story 17, Parent Update From Parent Index Page 

    # As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to edit that parent's info
    # When I click the link
    # I should be taken to that parent's edit page where I can update its information just like in User Story 12

    describe "As a visitor" do
      describe "When I visit the artist index page" do
        describe 'Next to every artist, I see a link to edit that artists info' do
          describe 'When I click the link' do
            it 'I should be taken to that artists edit page where I can update its information just like in User Story 12' do
              visit "/artists"
              
              click_button("Edit #{artist_1.name}")
              
              expect(current_path).to eq("/artists/#{artist_1.id}/edit")
            end
          end
        end
      end
    end
  end
end