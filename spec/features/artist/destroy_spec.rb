require 'rails_helper'

RSpec.describe 'Artist Page' do
  describe "Artist Delete" do
    let!(:artist_1) { Artist.create!(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
    let!(:artist_2) { Artist.create!(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
    let!(:artist_3) { Artist.create!(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }
    let!(:work_1) { Work.create!(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id) }
    let!(:work_2) { Work.create!(title: 'Violon dIngres', available_for_purchase: false, artist_id: artist_1.id) }   
  
    # User Story 19, Parent Delete 

    # As a visitor
    # When I visit a parent show page
    # Then I see a link to delete the parent
    # When I click the link "Delete Parent"
    # Then a 'DELETE' request is sent to '/parents/:id',
    # the parent is deleted, and all child records are deleted
    # and I am redirected to the parent index page where I no longer see this parent

    describe 'As a visitor' do
      describe 'When I visit a parent show page' do
        describe 'Then I see a link to delete the parent' do
          describe 'When I click the link "Delete Parent"' do
            describe 'Then a DELETE request is sent to /parents/:id' do
              describe 'the parent is deleted, and all child records are deleted' do
                it 'and I am redirected to the parent index page where I no longer see this parent' do
                  artist_4 = Artist.create(name: 'Ansel Adams')
                  visit "/artists/#{artist_4.id}"
                  
                  click_button("Delete")
                  
                  expect(current_path).to eq("/artists")
                  expect(page).to_not have_content('Ansel Adams')
                end
              end
            end
          end
        end
      end
    end

    # User Story 22, Parent Delete From Parent Index Page 

    # As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to delete that parent
    # When I click the link
    # I am returned to the Parent Index Page where I no longer see that parent

    describe 'As a visitor' do
      describe 'When I visit the parent index page' do
        describe 'Next to every parent, I see a link to delete that parent' do
          describe 'When I click the link' do
            it 'I am returned to the Parent Index Page where I no longer see that parent' do
              artist_4 = Artist.create(name: 'Ansel Adams')
              visit "/artists"
              
              click_button("Delete #{artist_4.name}")
              
              expect(current_path).to eq("/artists")
              expect(page).to_not have_content('Ansel Adams')
            end
          end
        end
      end
    end
  end
end