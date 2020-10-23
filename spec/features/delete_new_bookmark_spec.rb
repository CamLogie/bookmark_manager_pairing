feature 'User can delete bookmarks' do
  scenario 'by ticking check boxes and submitting delete button' do
    add_bookmark
    visit('/bookmarks')
    click_button('Delete Bookmarks')
    page.choose('Makers Academy')
    click_button('Submit')
    expect(page).not_to have_link("Makers Academy")
    expect(page).to have_link("Google")
  end
end
