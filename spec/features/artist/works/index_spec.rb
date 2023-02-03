require 'rails_helper'

RSpec.describe 'Artist Page' do
  describe "Artist Index" do
    let!(:artist_1) { Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
    let!(:artist_2) { Artist.create(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
    let!(:artist_3) { Artist.create(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }
    let!(:work_1) { Work.create!(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id) }
  end

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
  
  # User Story 7, Parent Child Count

  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent
  # end

  describe 'As a visitor' do
    describe 'When I visit an artist show page' do
      it 'I see a count of the number of works associated with this artist' do
        visit "/artists/#{artist_1.id}"
    
        expect(page).to have_content(work_1)
      end
    end
  end
end