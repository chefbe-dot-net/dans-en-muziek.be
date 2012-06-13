class Dialect < WLang::Html

  def tilde(buf, fn)
    text = value_of(fn)
    buf << context.markdown(text)
  end

  def append(buf, fn)
    path = resolve_relative_path(render(fn))
    buf << Tilt.new(path.to_s).render(scope)
  end

  tag '~',  :tilde
  tag '>>', :append

  private

    def resolve_relative_path(path)
      Path(template.path).parent / path
    end

  Tilt.prefer Tilt::WLangTemplate.with_options(:dialect => Dialect), 'wlang'
end
