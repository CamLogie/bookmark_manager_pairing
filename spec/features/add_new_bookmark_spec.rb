feature 'Add new bookmark' do
  scenario 'user can save a bookmark and receives confirmation' do
    visit('/')
    fill_in(:add_title, with: "title")
    fill_in(:add_bookmark, with: "url.com")
    click_button('Submit')
    expect(page).to have_content('title')
  end
end
