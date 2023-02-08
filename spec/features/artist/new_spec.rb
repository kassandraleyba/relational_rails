RSpec.describe 'Artist Page' do
  describe 'Artist New' do
    let!(:artist_1) { Artist.create!(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour) }
    let!(:artist_2) { Artist.create!(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour) }
    let!(:artist_3) { Artist.create!(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false) }
    let!(:work_1) { Work.create!(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id) }
    let!(:work_2) { Work.create(title: 'Violon dIngres', available_for_purchase: false, artist_id: artist_1.id) }
    
    # User Story 11, Parent Creation 

    describe "As a visitor" do
      describe "When I visit the Artist Index page" do
        describe 'Then I see a link to create a new Artist record, "New Artist"' do
          it 'When I click this link' do
            visit "/artists"
            
            click_link('New Artist')
            
            expect(current_path).to eq('/artists/new')
          end
        end
      end
    end


    describe 'Then I am taken to /artists/new where I  see a form for a new parent record' do
      describe 'When I fill out the form with a new artists attributes:' do
        describe 'And I click the button "Create Artist" to submit the form' do
          describe 'Then a `POST` request is sent to the /artists route,' do
            describe 'and I am redirected to the Artist Index page where I see the new Artist displayed' do
              it 'can ceate a new artist' do
                visit '/artists/new'

                fill_in('Name', with: 'Ansel Adams')
                fill_in('City', with: 'Pittsburgh')
                find('#alive_today').click
                click_button('Create Artist')

                expect(current_path).to eq("/artists")
                expect(page).to have_content("Ansel Adams")
              end
            end
          end
        end
      end
    end
  end
end