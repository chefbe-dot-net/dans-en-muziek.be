module DansEnMuziek
  class WebApp < Polygon::Base
    helpers Helpers

    ############################################################## Configuration
    configure do
      set :root,  Path.backfind('.[config.ru]')
      set :wlang, :layout => :"layouts/html5"
    end

    ############################################################## Normal routes

    get '/sitemap.xml' do
      content_type "application/xml"
      wlang :sitemap, :locals => sitemap_locals, :layout => false
    end

    get "/" do
      wlang :index, :locals => index_locals
    end

    ############################################################## Error handling

    # error handling
    error do
      'Sorry, an error occurred'
    end

  end
end
