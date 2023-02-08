require 'rails_helper'

RSpec.describe 'Work Page' do
  describe "Work Delete" do
    let!(:artist_1) { Artist.create!(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
    let!(:artist_2) { Artist.create!(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
    let!(:artist_3) { Artist.create!(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }
    let!(:work_1) { Work.create!(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id) }
    let!(:work_2) { Work.create!(title: 'Violon dIngres', available_for_purchase: false, artist_id: artist_1.id) }   
  
   # User Story 20, Child Delete 

    describe 'As a visitor' do
      describe 'When I visit a works show page' do
        describe 'Then I see a link to delete the work "Delete Work"' do
          describe 'When I click the link' do
            describe 'Then a DELETE request is sent to /works/:id' do
              describe 'the work is deleted' do
                it 'and I am redirected to the work index page where I no longer see this work' do

                  visit "/works/#{work_2.id}"
                  
                  click_button "Delete"
                  
                  expect(current_path).to eq("/works")
                  expect(page).to_not have_content('Violon dIngres')
                end
              end
            end
          end
        end
      end
    end

    # User Story 23, Child Delete From Childs Index Page 

    describe 'As a visitor' do
      describe 'When I visit the `child_table_name` index page or a parent `child_table_name` index page' do
        describe 'Next to every child, I see a link to delete that child' do
          describe 'When I click the link' do
            it 'I should be taken to the `child_table_name` index page where I no longer see that child' do
              visit "/works"
              
              click_button "Delete #{work_1.title}"
              
              expect(current_path).to eq("/works")
              expect(page).to_not have_content('Glass Tears')
            end
          end
        end
      end
    end
  end
end