require 'sinatra/base'
require './lib/bookmark_list'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/add_bookmarks' do
    Bookmark.create(url: params[:add_bookmark], title: params[:add_title])
    redirect to('/bookmarks')
  end

  get '/bookmarks/delete' do
    @bookmarks = Bookmark.all
    erb :delete_bookmarks
  end

  post '/bookmarks/delete' do
    Bookmark.delete(url: params[:url])
    redirect to('/bookmarks')
  end

  get '/bookmarks/:id/update' do
    @bookmark_id = params[:id]
    erb :'bookmarks/update'
  end


  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
