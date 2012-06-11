module DansEnMuziek
  class Dialect < WLang::Html

    def tilde(buf, fn)
      text = value_of(fn)
      buf << markdown(text)
    end

    def append(buf, fn)
      path = resolve_relative_path(render(fn))
      buf << Tilt.new(path.to_s).render(scope)
    end

    tag '~',  :tilde
    tag '>>', :append

  private

    def resolve_relative_path(path)
      options[:views_path] / path
    end

    def markdown(text)
      @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      @markdown.render(text)
    end

  end
  Tilt.prefer Tilt::WLangTemplate.with_options(:dialect => Dialect), 'wlang'
end
