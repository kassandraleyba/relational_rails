require 'rails_helper'

RSpec.describe 'Artists Works Page' do
  describe "Works Index" do

    let!(:artist_1) { Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
    let!(:artist_2) { Artist.create(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
    let!(:artist_3) { Artist.create(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }
    let!(:work_1) { Work.create!(title: 'Glass Tears', available_for_purchase: true, artist_id: artist_1.id) }
    let!(:work_2) { Work.create(title: 'Violon dIngres', available_for_purchase: false, artist_id: artist_1.id) }
    
    # User Story 3, Child Index 

    describe 'As a visitor' do
      describe 'When I visit /works' do
        it 'Then I see each Works in the system including the Works attributes' do
          visit "/works"
      
          expect(page).to have_content(work_1.title)
          expect(page).to have_content(work_1.available_for_purchase)
          expect(page).to have_content(work_2.title)
          expect(page).to have_content(work_2.available_for_purchase)
        end
      end
    end

    # User Story 4, Child Show 

    # As a visitor
    # When I visit '/child_table_name/:id'
    # Then I see the child with that id including the child's attributes
    # (data from each column that is on the child table)

    describe 'As a visitor' do
      describe 'When I visit /works/:id' do
        it 'Then I see the works with that id including the works attributes' do
          visit "/works/#{work_1.id}"
      
          expect(page).to have_content(work_1.title)
          expect(page).to have_content(work_1.available_for_purchase)
        end
      end
    end

    # User Story 8, Child Index Link

    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index

    describe 'As a visitor' do
      describe 'When I visit any page on the site' do
        it 'Then I see a link at the top of the page that takes me to the Work Index' do
          visit "/works"

          click_link('All Photographs')
          
          expect(current_path).to eq('/works')
        end
      end
    end

    # User Story 15, Child Index only shows `true` Records 

    # As a visitor
    # When I visit the child index
    # Then I only see records where the boolean column is `true`

    describe 'As a visitor' do
      describe 'When I visit the child index' do
        it 'Then I only see records where the boolean column is `true`' do

          visit "/works" #?sort=purchase_true"
          # address bar, grabbing key value pairs
  
          click_link("Only True")

          expect(current_path).to eq('/works')
          expect(page).to have_content('Glass Tears')
          expect(page).to_not have_content('Violon dIngres')
        end
      end
    end

    # User Story 18, Child Update From Childs Index Page 

    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to edit that child's info
    # When I click the link
    # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14

    describe 'As a visitor' do
      describe 'When I visit the `child_table_name` index page or a parent `child_table_name` index page' do
        describe 'Next to every child, I see a link to edit that childs info' do
          describe 'When I click the link' do
            it 'I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14' do
              visit "/works"
          
              click_button("Edit #{work_1.title}")
          
              expect(current_path).to eq("/works/#{work_1.id}/edit")
            end
          end
        end
      end
    end
  end
end