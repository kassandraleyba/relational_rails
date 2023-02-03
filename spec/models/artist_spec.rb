require 'rails_helper'

RSpec.describe Artist, type: :model do
  let!(:artist_1) { Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
  let!(:artist_2) { Artist.create(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
  let!(:artist_3) { Artist.create(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }
  let!(:work_1) { Work.create!(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id) }
  let!(:work_2) { Work.create(title: 'Violon dIngres', available_for_purchase: false, artist_id: artist_1.id) }
  let!(:work_3) { Work.create(title: 'California Kiss', available_for_purchase: false, artist_id: artist_2.id) }
  
  it {should have_many :works}

  describe 'class methods' do
    # called on entire data set
    # instance method is called on single row
    it 'sorting from most recently created first' do
      expect(Artist.sort).to eq([artist_3, artist_1, artist_2])
    end
  end

  describe 'instance methods' do
    it "can have multiple works" do
      expect(artist_1.work_count).to eq(2)
      expect(artist_2.work_count).to eq(1)
    end
  end
end