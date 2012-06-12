require 'polygon'
require 'helpers'
require 'dialect'

class App < Polygon::Base
  helpers Helpers

  get '/sitemap.xml' do
    content_type "application/xml"
    wlang :sitemap, :locals => sitemap_locals, :layout => false
  end

  get "/" do
    wlang :index, :locals => index_locals.merge(:app => self)
  end

  # error handling
  error do
    'Sorry, an error occurred'
  end

end
