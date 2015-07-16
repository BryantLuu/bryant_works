class PostsController < ApplicationController
  post '/' do
    user = User.find(params[:user_id])
    user.posts.create(content: params[:Content])
    redirect "/users/#{params[:user_id]}"
  end

  delete '/:id' do
    post = Post.find(params[:id])
    post.delete
    redirect "/users/#{params[:user_id]}"
  end



end

