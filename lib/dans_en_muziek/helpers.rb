module DansEnMuziek
  module Helpers

    def content_loader
      Polygon::ContentLoader.new.
        enable_yaml_front_matter!(".md").
        enable_yaml!(".yml")
    end

    def root_content
      Polygon::Content.new(dynamic, content_loader)
    end

    # Converts a path to a file in dynamic content
    def path2file(path)
      path == "" ? dynamic/"index.yml" : nil
    end

    # Convert a file from dynamic content to a path
    def file2path(file)
      path = (file % dynamic).rm_ext
      path = path.basename.to_s == "index" ? path.parent : path
      path == Path('.') ? Path("") : path
    end

    # Returns the content for a given file
    def file2content(file)
      h           = root_content.entry(file).to_hash
      h[:path]    = file2path(file)
      h[:lastmod] = file.mtime.strftime("%Y-%m-%d")
      h
    end

    def content_for(path)
      file2content path2file(path)
    end

    # Returns true if we are in production, false otherwise
    def in_production
      settings.environment == :production
    end

    # Returns the list of writings
    def writings
      dynamic.glob("**/*.yml").
               map{ |file|  file2content(file) }.
              sort{ |h1,h2| h1["date"] <=> h2["date"] }
    end

  end # module Helpers
end # module RevisionZero
