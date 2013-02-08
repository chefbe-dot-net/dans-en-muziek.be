module Helpers

  def entry2path(entry)
    path = entry.relative_path.rm_ext
    path = entry.index? ? path.parent : path
    path == Path('.') ? Path("") : path
  end

  def sitemap_locals
    { :urls => database.query{ sitemap } }
  end

end
