module DansEnMuziek
  module Helpers

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

    def sitemap
      file2path = lambda{|f| file2path(f) }
      lispy do
        (extend :entries,
                :path    => proc{ file2path.call(entry.path)            },
                :lastmod => proc{ entry.path.mtime.strftime("%Y-%m-%d") })
      end
    end

    def sitemap_locals
      { :urls => sitemap }
    end

    def index_locals
      sitemap = self.sitemap
      lispy do
        (unwrap \
          (extend (restrict sitemap, :path => Path("")),
                  :data => lambda{ entry.to_hash }),
          :data)
      end.to_a.first
    end

  end # module Helpers
end # module RevisionZero
