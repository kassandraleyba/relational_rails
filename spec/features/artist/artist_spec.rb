require 'rails_helper'

RSpec.describe 'the artists show page' do

# User Story 1, Parent Index 
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

  it 'displays the artist name' do
    artist = Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false)
    # work = Work.create!(title: 'Glass Tears', available_for_purchase: false)
    # work_2 = Work.create!(title: 'Violon dIngres', available_for_purchase: false)

    visit "/artist/#{artist.id}"

    expect(page).to have_content(artist.name)
    # expect(page).to_not have_content(work_2.title)
  end
end