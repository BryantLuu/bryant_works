require_relative 'frank'
map('/welcomes') { run WelcomesController }
map('/users') { run UsersController }
map('/sessions') { run SessionsController }
map('/posts') { run PostsController }
map "/css" do
  run Rack::Directory.new("./app/public/stylesheets")
end
map "/js" do
  run Rack::Directory.new("./app/public/javascripts")
end