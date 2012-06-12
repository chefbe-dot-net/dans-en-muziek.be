module DansEnMuziek
  class WebApp < Polygon::Base
    helpers Helpers

    ############################################################## Configuration
    configure do
      set :root,  Path.backfind('.[config.ru]')
      set :wlang, :layout => :"layouts/html5"
    end

    ############################################################## Normal routes

    get "/" do
      wlang :index, :locals => content_for("")
    end

    ############################################################## Error handling

    # error handling
    error do
      'Sorry, an error occurred'
    end

  end
end
