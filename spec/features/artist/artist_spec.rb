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
        artist_1 = Artist.create!(name: 'Man Ray', city: 'Philadelphia', alive_today: false)
        work = Work.create!(title: 'Glass Tears', available_for_purchase: false, artists_id: 1)
        work_2 = Work.create!(title: 'Violon dIngres', available_for_purchase: false)
    
        visit "/artist_1/#{artist_1.id}"
    
        expect(page).to have_content(artist_1.name)
        expect(page).to_not have_content(artist_2.name)
      end
    end
  end

# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
  describe 'As a visitor' do
    describe 'When I visit /parents/:id' do
      it 'shows the parent with that id including the attributes' do
        artist_1 = Artist.create!(name: 'Man Ray', city: 'Philadelphia', alive_today: false)
    
        visit "/artist_1/:id#{artist_1.id}"
    
        expect(page).to have_content(artist_1.id)
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_1.city)
        expect(page).to have_content(artist_1.alive_today)
      end
    end
  end
end