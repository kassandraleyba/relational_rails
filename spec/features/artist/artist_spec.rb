require 'rails_helper'

RSpec.describe 'the artists show page' do

# User Story 1, Parent Index 
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
  describe "As a visitor" do
    describe "When I visit '/parents'" do
      it 'Then I see the name of each parent record in the system' do
        artist_1 = Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false)
        artist_2 = Artist.create(name: 'Elliott Erwitt', city: 'Paris', alive_today: true)
        artist_3 = Artist.create(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false)
    
        visit "/artists"
    
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.name)
        expect(page).to have_content(artist_2.name)
      end
    end
  end

# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
  describe 'As a visitor' do
    describe 'When I visit /parents/:id' do
      it 'Then I see the parent with that id including the parents attributes' do
        artist_1 = Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false)
    
        visit "/artists/#{artist_1.id}"
    
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_1.city)
        expect(page).to have_content(artist_1.alive_today)
      end
    end
  end

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