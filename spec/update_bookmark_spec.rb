describe '.update' do
  it 'updates the bookmark with the given data' do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

    expect(updated_bookmark).to be_a Bookmark
    expect(updated_bookmark.id).to eq bookmark.id
    expect(updated_bookmark.title).to eq 'Snakers Academy'
    expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
  end
end
