require 'rails_helper'

RSpec.describe 'Artist Page' do
  describe "Artist Index" do
    let!(:artist_1) { Artist.create!(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
    let!(:artist_2) { Artist.create!(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
    let!(:artist_3) { Artist.create!(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }
    let!(:work_1) { Work.create!(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id) }

    # User Story 5, Parent Children Index 
    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    # Then I see each Child that is associated with that Parent with each Child's attributes
    # (data from each column that is on the child table)

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

    # As a visitor
    # When I visit a parent show page ('/parents/:id')
    # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
    describe 'As a visitor' do
      describe 'When I visit a artist show page (/artists/:id)' do
        it 'Then I see a link to take me to that artists works page (/artists/:id/works)' do
          visit "/artists/#{artist_1.id}"
        
          click_link("#{artist_1.name}'s Photos")
          
          expect(current_path).to eq("/artists/#{artist_1.id}/works")
        end
      end
    end
  end
end