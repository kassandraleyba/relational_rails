require 'rails_helper'

RSpec.describe 'Artist Page' do
  describe "Artist Index" do
    let!(:artist_1) { Artist.create!(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
    let!(:artist_2) { Artist.create!(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
    let!(:artist_3) { Artist.create!(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }
    let!(:work_1) { Work.create!(title: 'Glass Tears', price: 1750, available_for_purchase: false, artist_id: artist_1.id) }
    let!(:work_2) { Work.create(title: 'Violon dIngres', price: 1500, available_for_purchase: false, artist_id: artist_1.id) }

    # User Story 5, Parent Children Index 

    describe 'As a visitor' do
      describe 'When I visit /artists/:id/works' do
        it 'Then I see each work that is associated with that artist with each artists attributes' do
          visit "/artists/#{artist_1.id}/works"
        
          expect(page).to have_content(work_1.title)
          expect(page).to have_content(work_1.available_for_purchase)
        end
      end
    end

    # User Story 10, Parent Child Index Link

    describe 'As a visitor' do
      describe 'When I visit a artist show page (/artists/:id)' do
        it 'Then I see a link to take me to that artists works page (/artists/:id/works)' do
          visit "/artists/#{artist_1.id}"
        
          click_link("#{artist_1.name}'s Photos")
          
          expect(current_path).to eq("/artists/#{artist_1.id}/works")
        end
      end
    end

    # User Story 16, Sort Parent's Children in Alphabetical Order by name 

    describe 'As a visitor' do
      describe 'When I visit the Artists works Index Page' do
        describe 'Then I see a link to sort works in alphabetical order' do
          describe 'When I click on the link' do
            it 'Im taken back to the Artists works Index Page where I see all of the artist work in alphabetical order' do
              visit "/artists/#{artist_1.id}/works"
            
              click_link("Sort Alphabetically")
              
              expect(current_path).to eq("/artists/#{artist_1.id}/works")
              expect(work_1.title).to appear_before(work_2.title)
            end
          end
        end
      end
    end

    # User Story 21, Display Records Over a Given Threshold 

    describe 'As a visitor' do
      describe 'When I visit the Parents children Index Page' do
        describe 'I see a form that allows me to input a number value' do
          describe 'When I input a number value and click the submit button that reads Only return records with more than `number` of column_name' do
            it 'Then I am brought back to the current index page with only the records that meet that threshold shown.' do
              visit "/artists/#{artist_1.id}/works"

              click_button "Filter Price"
          
              fill_in "Price", with: 1600
              click_button "Filter Price"
          
              expect(current_path).to eq("/artists/#{artist_1.id}/works")
              expect(page).to have_content('Glass Tears')
              expect(page).to_not have_content('Violon dIngres')
            end
          end
        end
      end
    end
  end
end