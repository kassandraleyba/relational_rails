require 'rails_helper'

RSpec.describe 'the works page' do
  # User Story 3, Child Index 

  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes
  # (data from each column that is on the child table)

  describe 'As a visitor' do
    describe 'When I visit /child_table_name' do
      it 'Then I see each Child in the system including the Childs attributes' do
        artist_1 = Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false)

        work_1 = Work.create!(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id)
    
        visit "/works"
    
        expect(page).to have_content(work_1.title)
        expect(page).to have_content(work_1.available_for_purchase)
      end
    end
  end

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