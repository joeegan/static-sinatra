# rubygems required
require 'sinatra'
require 'sinatra/reloader'
require 'redcloth_scan'
require 'compass'
require 'sass/plugin/rack'
require 'haml'

# set sinatra's variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
APP_ROOT = File.dirname(__FILE__)
set :views, "views"
set :public_folder, "public"
set :static_cache_control, [:public_folder, :max_age => 300]

# import our helpers
require './helpers/utilities'
helpers Sinatra::Utilities
require './helpers/navigation'
helpers Sinatra::Navigation
require './helpers/custom'
helpers Sinatra::Custom

# ensure that every rack request creates a new css file
use Sass::Plugin::Rack
Sass::Plugin.options[:css_location] = "public/stylesheets"
Sass::Plugin.options[:template_location] = "views/sass"

# compass/sass config
configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'stylesheets'
    config.images_dir = './images'
    config.http_path = "/"
    config.http_images_path = "../images"
    config.http_stylesheets_path = "./stylesheets"
  end
  set :sass, Compass.sass_engine_options
end


# routes

get '/stylesheets/:name' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"sass/#{params[:name]}", Compass.sass_engine_options )
end

['/','/index.html'].each do |path|
  get path do
    redirect to('/fish/index.html')
  end
end

get "/index.html" do
  haml :"pages/index", {
    :layout => :"layouts/docs"
  }
end

get "/:primary/index.html" do
  haml :"pages/#{params[:primary]}/index", {
    :layout => :"layouts/application", :locals => {
      :primary_token => params[:primary],
      :primary_url => params[:primary]+"/",
      :is_primary => true
    }
  }
end

get "/:primary/:secondary/index.html" do
  haml :"pages/#{params[:primary]}/#{params[:secondary]}/index", {
    :layout => :"layouts/application", :locals => {
      :secondary_name => params[:secondary],
      :primary_token => params[:primary],
      :primary_url => params[:primary]+"/",
      :is_secondary => true
    }
  }
end

get "/:primary/:secondary/:tertiary/index.html" do
  haml :"pages/#{params[:primary]}/#{params[:secondary]}/#{params[:tertiary]}/index", {
    :layout => :"layouts/application", :locals => {
      :secondary_name => params[:secondary],
      :primary_token => params[:primary],
      :primary_url => params[:primary]+"/",
      :is_tertiary => true
    }
  }
end