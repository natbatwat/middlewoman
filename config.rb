require "uglifier"
require "helpers/custom_helpers"
helpers CustomTemplateHelpers

#===========#
#- COMPASS -#
#===========#

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

#===========#
#- HELPERS -#
#===========#

activate :automatic_image_sizes # Automatic image dimensions on image_tag helper
activate :autoprefixer do |config|
  config.browsers = ['last 3 versions', 'Explorer >= 9']
end
activate :directory_indexes # Activate directory indexes for pretty urls
activate :dotenv #.env
activate :gzip # Activate gzip compression
activate :search_engine_sitemap # Active sitemap generator

configure :development do
  activate :livereload
end

set :build_dir, 'build'
set :data_dir, 'data'
set :fonts_dir, 'fonts'
set :helpers_dir, 'helpers'
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

set :index_file, 'index.html'

set :debug_assets, true # Prevent asset concatenation in development
set :url_root, build? ? ENV["URL_PRODUCTION"] : ENV["URL_DEVELOPMENT"]

page "/404.html", :directory_index => false
page 'sitemap.html', layout: false
page 'sitemap.xml', layout: false
page 'feed.xml', layout: false


configure :build do
  activate :minify_css
  activate :minify_javascript, :inline => true, :compressor => Uglifier.new(:mangle => false, :comments => :none)
  activate :minify_html, remove_comments: true
  activate :asset_hash # Enable cache buster
  activate :relative_assets # Use relative URLs
  activate :smusher

  # activate :favicon_maker do |f|
  #   f.template_dir  = File.join(root, 'source/images/favicons/*')
  #   f.output_dir    = File.join(root, 'build/images/favicons')
  #   f.icons = {
  #     "favicon_template_hires.png" => [
  #       { icon: "favicon-152x152.png" },
  #       { icon: "favicon-120x120.png" },
  #       { icon: "favicon-76x76.png" },
  #       { icon: "favicon-60x60.png" },
  #     ],
  #     "favicon_template_lores.png" => [
  #       { icon: "favicon-32x32.png" },
  #       { icon: "favicon-16x16.png" },
  #       { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" }
  #     ]
  #   }
  # end

end
