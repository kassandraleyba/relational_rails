RSpec.describe 'Artist Page' do
  describe 'Artist New' do
    # User Story 11, Parent Creation 

    # As a visitor
    # When I visit the Parent Index page
    # Then I see a link to create a new Parent record, "New Parent"
    # When I click this link
    # Then I am taken to '/parents/new' where I  see a form for a new parent record
    # When I fill out the form with a new parent's attributes:
    # And I click the button "Create Parent" to submit the form
    # Then a `POST` request is sent to the '/parents' route,
    # a new parent record is created,
    # and I am redirected to the Parent Index page where I see the new Parent displayed.

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
   

# it 'links to the new artist page from the artists index' do
#   visit '/artists'

#   click_link('New Artist')
#   # click_on looks for a link or button
#   # click_link looks for a link specifically
#   expect(current_path).to eq('/artists/new')
# end

# it 'can ceate a new artist' do
#   visit '/artists/new'

#   fill_in('Name', with: 'Prince')
#   click_button('Create Artist')

#   expect(current_path).to eq("/artists")
#   expect(page).to have_content("Prince")
# end