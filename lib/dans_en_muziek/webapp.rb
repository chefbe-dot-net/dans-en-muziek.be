module DansEnMuziek
  class WebApp < Polygon::Base
    helpers Helpers

    ############################################################## Configuration
    configure do
      set :root, Path.backfind('.[config.ru]')
    end

    ############################################################## Normal routes

    get "/" do
      content = url2content("contact").to_hash
      wlang :html, content
    end

    ############################################################## Error handling

    # error handling
    error do
      'Sorry, an error occurred'
    end

  end
end
