def test_connection
  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec ("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
  connection.exec ("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google');")
  connection.exec ("INSERT INTO bookmarks (url, title) VALUES ('http://www.ahotdogisnotasandwich.com', 'A Hotdog is Not A Sandwich');")
end

def add_bookmark
  visit('/')
  fill_in(:add_bookmark, with: "http://www.makersacademy.com")
  fill_in(:add_title, with: "Makers Academy")
  click_button("Submit")
  visit('/')
  fill_in(:add_bookmark, with: "http://www.google.com")
  fill_in(:add_title, with: "Google")
  click_button("Submit")
end