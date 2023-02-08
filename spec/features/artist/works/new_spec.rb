require 'rails_helper'

RSpec.describe 'Artists Works New Page' do
  describe 'Artists Work New' do

    let!(:artist_1) { Artist.create!(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
    let!(:artist_2) { Artist.create!(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
    let!(:artist_3) { Artist.create!(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }
    let!(:work_1) { Work.create!(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id) }
    let!(:work_2) { Work.create!(title: 'Violon dIngres', available_for_purchase: false, artist_id: artist_1.id) }  

    # User Story 13, Parent Child Creation 

    describe "As a visitor" do
      describe "When I visit an Artist Work Index page" do
        describe 'Then I see a link to add a new adoptable work for that artist "Create Work' do
          describe 'When I click the link' do
            it 'I am taken to /artists/:artist_id/works/new where I see a form to add a new adoptable work' do
              visit "/artists/#{artist_1.id}/works"
              
              click_link('New Works')
              
              expect(current_path).to eq("/artists/#{artist_1.id}/works/new")
            end
          end
        end
      end
    end


    describe 'When I fill in the form with the works attributes:' do
      describe 'And I click the button "Work Child"' do
        describe 'Then a `POST` request is sent to /artists/:artist_id/works' do
          describe 'a new work object/row is created for that artist,' do
            it 'and I am redirected to the Artist Works Index page where I can see the new work listed' do
              visit "/artists/#{artist_1.id}/works/new"

              fill_in('Title', with: 'Glass Tears')
              # fill_in('City', with: 'Pittsburgh')
              # find('#alive_today').click
              click_button('Create Work')

              expect(current_path).to eq("/works")
              expect(page).to have_content("Glass Tears")
            end
          end
        end
      end
    end
  end
end