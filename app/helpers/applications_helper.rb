module ApplicationsHelper
  def show_or_na(value)
    value.presence || "n/a"
  end

  def link_to_ordered(text, type)
    link_to text, rating_applications_path(order: type)
  end

  def link_to_application_project(application)
    if project = application.project
      link_txt = project.name
      link_to link_txt, project
    end
  end

  def format_application_flags(application)
    flags = Application::FLAGS.select do |flag|
      application.send(:"#{flag}?")
    end
    flags.map { |flag| flag.to_s.titleize }.join(', ')
  end
end
