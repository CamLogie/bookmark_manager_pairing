require 'sinatra/base'
require './lib/bookmark_list'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/add_bookmarks' do
    Bookmark.create(url: params[:add_bookmark], title: params[:add_title])
    redirect to('/confirm')
  end

  get '/confirm' do
    erb :confirm
  end

  get '/bookmarks/delete' do
    @bookmarks = Bookmark.all
    erb :delete_bookmarks
  end



  run! if app_file == $0
end
