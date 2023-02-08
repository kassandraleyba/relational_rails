require 'rails_helper'

RSpec.describe Work, type: :model do

  let!(:artist_1) { Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
  let!(:artist_2) { Artist.create(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
  let!(:artist_3) { Artist.create(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }

  let!(:work_1) { Work.create(title: 'Glass Tears', price: 1500, available_for_purchase: false, artist_id: artist_1.id) }
  let!(:work_2) { Work.create(title: 'Violon dIngres', price: 1400, available_for_purchase: false, artist_id: artist_1.id) }

  let!(:work_3) { Work.create(title: 'California Kiss', price: 1750, available_for_purchase: false, artist_id: artist_2.id) }
  let!(:work_4) { Work.create(title: 'Alabama Southern Charm', price: 1550, available_for_purchase: true, artist_id: artist_2.id) }

  let!(:work_5) { Work.create(title: 'Behind the Gare Saint-Lazare', price: 1900, available_for_purchase: false, artist_id: artist_3.id) }
  let!(:work_6) { Work.create(title: 'Rue Mouffetard', price: 1650, available_for_purchase: true, artist_id: artist_3.id) }

  it {should belong_to :artist}

  describe 'class methods' do
    # called on entire data set
    # instance method is called on single row
    it 'filter purchase true' do
      expect(Work.purchase_true).to eq([work_4, work_6])
    end
  end

  describe 'class methods' do
    it 'filter price' do
      expect(Work.purchase_price(1600)).to eq([work_3, work_5, work_6])
    end
  end
end