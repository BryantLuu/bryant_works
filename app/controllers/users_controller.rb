class UsersController < ApplicationController
  get '/' do
    @title = 'All Users'
    @users = User.all
    erb :main_layout do
      erb :"users/index"   
    end
  end

  get '/new' do
    @title = 'New User'
    erb :main_layout do
      erb :"users/new"
    end
  end

  post '/' do
    if params["Password"] == params["Password Confirmation"]
      user = User.new
      user.email = params["Email"]
      user.first_name = params["First Name"]
      user.last_name = params["Last Name"]
      password_salt = BCrypt::Engine.generate_salt
      password_hash = BCrypt::Engine.hash_secret(params["Password"], password_salt)

      user.salt = password_salt
      user.encrypted_password = password_hash
      user.save

      redirect "/users"
    else
      redirect "/users"
    end
  end

  get '/:id' do
    @title = "User Profile"
    @user = User.find(params[:id])
    erb :main_layout do
      erb :"users/show"
    end
  end

  get '/:id/edit' do
    @title = "Edit User"
    @user = User.find(params[:id])
    erb :main_layout do
      erb :"users/edit"
    end
  end

  patch '/:id' do
    user = User.find(params[:id])
    user.update(email: params[:Email], first_name: params["First Name"], last_name: params["Last Name"])
    redirect "/users"
  end

  delete '/:id' do
    user = User.find(params[:id])
    user.delete
    redirect "/users"
  end

end
