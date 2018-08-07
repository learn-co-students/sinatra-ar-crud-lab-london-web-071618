
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #loading a new form
  get '/posts/new' do
    erb :new
  end

  #creating a posts
  post '/posts' do
    @post = Post.create(params)

    redirect to '/posts'
  end

  #goes to index page
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  #grabbing posts with a specific #id (show page)
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  #loading the edit form for a particular #id
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  #updating that particular post
  patch '/posts/:id' do  
      @post = Post.find_by_id(params[:id])
      @post.update(name: params[:name], content: params[:content])
      @post.save
      redirect "/posts/#{@post.id}"
      erb :show
  end

  #deleting a particular post
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :delete
  end


end
