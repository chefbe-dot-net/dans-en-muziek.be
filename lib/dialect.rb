class Dialect < WLang::Html

  def tilde(buf, fn)
    text = value_of(fn)
    buf << context.markdown(text)
  end

  def greater(buf, fn)
    super
  rescue NameError
    path = partial_path(render(fn))
    buf << context.wlang(path.to_sym, :locals => scope.subject, :layout => false)
  end

  tag '~', :tilde
  tag '>', :greater

  private

    def partial_path(path)
      (Path(template.path).parent / path) % Path(context.settings.views)
    end

  Tilt.prefer Tilt::WLangTemplate.with_options(:dialect => Dialect), 'wlang'
end
