# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bcms_tagged_pages}
  s.version = "0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kimmy Chirnside"]
  s.date = %q{2010-04-18}
  s.description = %q{Extension to BCMS pages to allow tagging and browsing pages and content by tag}
  s.email = %q{kimmy.chirnside@gmail.com}
  s.extra_rdoc_files = [
     "README"
  ]
  s.files = [
    "app/portlets/tagged_content_portlet.rb",
    "app/portlets/tagged_pages_portlet.rb",
    "app/portlets/tags_with_content_portlet.rb",
    "app/portlets/tags_with_pages_portlet.rb",
    "app/portlets/helpers/tags_with_pages_portlet_helper.rb",
    "app/portlets/helpers/tags_with_content_portlet_helper.rb",
    "app/portlets/helpers/tagged_pages_portlet_helper.rb",
    "app/portlets/helpers/tagged_content_portlet_helper.rb",
    "app/views/portlets/tagged_content/_form.html.erb",
    "app/views/portlets/tagged_content/_item.html.erb",
    "app/views/portlets/tagged_content/render.html.erb",
    "app/views/portlets/tagged_pages/_form.html.erb",
    "app/views/portlets/tagged_pages/_page.html.erb",
    "app/views/portlets/tagged_pages/render.html.erb",
    "app/views/portlets/tags_with_content/_cloud.html.erb",
    "app/views/portlets/tags_with_content/_form.html.erb",
    "app/views/portlets/tags_with_content/_list.html.erb",
    "app/views/portlets/tags_with_content/render.html.erb",
    "app/views/portlets/tags_with_pages/_cloud.html.erb",
    "app/views/portlets/tags_with_pages/_form.html.erb",
    "app/views/portlets/tags_with_pages/_list.html.erb",
    "app/views/portlets/tags_with_pages/render.html.erb",
    "db/migrate/20100412083709_create_tagged_pages_portlet.rb",
    "lib/bcms_tagged_pages.rb",
    "lib/bcms_tagged_pages/generators/files/_form.html.erb",
    "lib/bcms_tagged_pages/models/page.rb",
    "rails/init.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/k1mmeh/bcms_tagged_pages}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Extension to BCMS pages to allow tagging and browsing by tag}
  s.test_files = []

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.3.0') then
    else
    end
  else
  end
end
