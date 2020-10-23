require 'bookmark_list'

describe Bookmark do

  describe '.all' do
    it 'returns a list of bookmarks' do
      test_connection

      bookmark1 = Bookmark.all.first
      bookmark2 = Bookmark.all[1]
      bookmark3 = Bookmark.all.last

      expect(bookmark1.title).to include 'Makers Academy'
      expect(bookmark2.title).to include 'Google'
      expect(bookmark3.title).to include 'A Hotdog is Not A Sandwich'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
      expect(bookmark.title).to eq 'Test Bookmark'
    end
  end

  describe "#delete" do
    it "deletes bookmarks from database" do
      test_connection
      Bookmark.delete(url: 'http://www.makersacademy.com')
      bookmark = Bookmark.all.first
      expect(Bookmark.all).not_to include(bookmark)
    end
  end


end
