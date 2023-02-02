require 'rails_helper'

RSpec.describe 'the works page' do
  let!(:artist_1) { Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
  let!(:artist_2) { Artist.create(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
  let!(:artist_3) { Artist.create(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }
  let!(:work_1) { Work.create!(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id) }
  
  # User Story 4, Child Show 

  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes
  # (data from each column that is on the child table)

  describe 'As a visitor' do
    describe 'When I visit /child_table_name/:id' do
      it 'Then I see the child with that id including the childs attributes' do
        artist_1 = Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false)

        work_1 = Work.create!(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id)
    
        visit "/works/#{work_1.id}"
    
        expect(page).to have_content(work_1.title)
        expect(page).to have_content(work_1.available_for_purchase)
      end
    end
  end
end