module DansEnMuziek
  class WebApp < Polygon::Base
    helpers Helpers

    ############################################################## Configuration
    configure do
      set :root, Path.backfind('.[config.ru]')
    end

    ############################################################## Normal routes

    get "/" do
      content = file2content(path2file(""))
      wlang :body, :locals => content, :layout => :html
    end

    ############################################################## Error handling

    # error handling
    error do
      'Sorry, an error occurred'
    end

  end
end
