require 'rails_helper'

RSpec.describe 'Works Page' do
  describe "Works Edit" do
    let!(:artist_1) { Artist.create!(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
    let!(:artist_2) { Artist.create!(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
    let!(:artist_3) { Artist.create!(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }
    let!(:work_1) { Work.create!(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id) }
    let!(:work_2) { Work.create!(title: 'Violon dIngres', available_for_purchase: false, artist_id: artist_1.id) } 

      # User Story 14, Child Update 

      # As a visitor
      # When I visit a Child Show page
      # Then I see a link to update that Child "Update Child"
      # When I click the link
      # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
      
      # When I click the button to submit the form "Update Child"
      # Then a `PATCH` request is sent to '/child_table_name/:id',
      # the child's data is updated,
      # and I am redirected to the Child Show page where I see the Child's updated information

    describe 'As a visitor' do
      describe 'When I visit a Work Show page' do
        describe 'Then I see a link to update that Work "Update Work"' do
          describe 'When I click the link' do
            it 'I am taken to /works/:id/edit where I see a form to edit the works attributes:' do
                visit "/artists"
                
                click_button("Edit #{artist_1.name}")
                # click_button("Edit")
                
                expect(current_path).to eq("/artists/#{artist_1.id}/edit")
              end
            end
          end
        end
      end
    end

    # describe 'When I click the button to submit the form "Update Works"' do
    #   describe 'Then a `PATCH` request is sent to /works/:id,' do
    #     describe 'the works data is updated,' do
    #       it 'and I am redirected to the Work Show page where I see the Works updated information' do
    #           visit "/artists"
              
    #           click_button("Edit #{artist_1.name}")
    #           # click_button("Edit")
              
    #           expect(current_path).to eq("/artists/#{artist_1.id}/edit")
    #         end
    #       end
    #     end
    #   end
    # end
  end
end