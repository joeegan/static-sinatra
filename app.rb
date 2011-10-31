# required rubygems
require 'sinatra'
require 'sinatra/reloader'
require 'compass'
require 'sass/plugin/rack'
require 'haml'

# import our helpers
require './helpers/utilities'
helpers Sinatra::Utilities
require './helpers/navigation'
helpers Sinatra::Navigation
require './helpers/custom'
helpers Sinatra::Custom
require './config/sass'

# set sinatra's variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
APP_ROOT = File.dirname(__FILE__)

set :views, "views"
set :public_folder, "public"
set :static_cache_control, [:public_folder, :max_age => 300]


# routes

get '/stylesheets/:name' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"sass/#{params[:name]}")
end

['/','/index.html'].each do |path|
  get path do
    haml :"pages/index", {
      :layout => :"layouts/application"
    }
  end
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

#remove if only one level of navigation
get "/:primary/:secondary/index.html" do
  haml :"pages/#{params[:primary]}/#{params[:secondary]}/index", {
    :layout => :"layouts/application", :locals => {
      :secondary_name => params[:secondary],
      :primary_token => params[:primary],
      :primary_url => params[:primary]+"/",
      :is_secondary => true,
      :is_tertiary => true
    }
  }
end

#remove if only two levels of navigation
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