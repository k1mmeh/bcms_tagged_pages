require 'fileutils'
gem_root = File.expand_path(File.join(File.dirname(__FILE__), ".."))

Cms.add_to_rails_paths gem_root
Cms.add_generator_paths gem_root, "db/migrate/[0-9]*_*.rb"

bcms_path = Gem.loaded_specs['browsercms'].full_gem_path
page_view_dir = File.join('app', 'views', 'cms', 'pages')
# copy core _form.html.erb to path in module
FileUtils.mkdir_p(File.join(gem_root, page_view_dir))
FileUtils.cp(File.join(bcms_path, page_view_dir, '_form.html.erb'), File.join(gem_root, page_view_dir, '_form.html.erb'))
# now concat module specific code to end of new _form.html.erb
File.open(File.join(gem_root, page_view_dir, '_form.html.erb'), 'a') do |f|
  File.open(File.join(gem_root, 'lib', 'bcms_tagged_pages', 'generators', 'files', '_form.html.erb'), 'r') do |inner_f|
    while line = inner_f.gets
      f.puts(line)
    end
  end
end

Cms.add_generator_paths gem_root, File.join(page_view_dir, '_form.html.erb')

