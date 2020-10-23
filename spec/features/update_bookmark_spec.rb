feature 'User can update bookmarks' do
  scenario 'should have an update button next to each bookmark' do
  bookmark = Bookmark.create(url: 'www.guardian.com', title: 'The Grauniad')
    visit('/bookmarks')
    click_on('Update')
    fill_in('url', with: 'www.theguardian.com')
    fill_in('title', with: 'The Guardian')
    click_on('Submit')
    expect(page).not_to have_link('The Grauniad', href: 'www.guardian.com')
    expect(page).to have_link('The Guardian', href: 'www.theguardian.com')
  end
end
