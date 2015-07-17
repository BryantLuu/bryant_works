require_relative 'frank'
map('/welcomes') { run WelcomesController }
map "/css" do
  run Rack::Directory.new("./app/public/stylesheets")
end
map "/js" do
  run Rack::Directory.new("./app/public/javascripts")
end