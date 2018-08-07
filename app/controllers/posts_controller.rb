  class PostsController < ApplicationController
  
  get '/posts' do
    @posts = Post.all
    erb :"posts/index"
  end
  
  get '/posts/new' do
   erb :"posts/new"
  end
  
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :"posts/show"
  end
  
  post '/posts' do
    @post = Post.create(name: params["name"], content: params["content"])
    redirect "/posts"
  end
  
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :"posts/edit"
  end
  
  # get '/posts/:id/delete' do
  #   @post = Post.find(params[:id])
  #   erb :"posts/delete"
  # end
 
  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.update(name: params["name"], content: params["content"])
    redirect "/posts/#{post.id}"
  end 

 delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    redirect "/posts/deleted"
  end

end