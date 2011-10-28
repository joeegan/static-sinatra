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