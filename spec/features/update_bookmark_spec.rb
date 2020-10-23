feature 'User can update bookmarks' do
  scenario 'should have an update button next to each bookmark' do
    add_bookmark
    visit('/bookmarks')
    expect(page).to have_button('Update')
  end
end