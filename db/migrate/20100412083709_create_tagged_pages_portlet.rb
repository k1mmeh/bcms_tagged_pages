class CreateTaggedPagesPortlet < ActiveRecord::Migration
  def self.up

    by_tag_page = Page.create!(
      :name => "Pages by Tag",
      :path => "/pages/by_tag",
      :section => Section.root.first,
      :template_file_name => "default.html.erb")

    by_tag_page.page_routes.create(
      :name => "Pages with Tag",
      :pattern => "/browse/pages/tag/:tag",
      :code => '@tag = Tag.find_by_name(params[:tag])'
    )

    by_tag_content_page = Page.create!(
      :name => "Content by Tag",
      :path => "/content/by_tag",
      :section => Section.root.first,
      :template_file_name => "default.html.erb")


    by_tag_content_page.page_routes.create(
      :name => "Content with Tag",
      :pattern => "/browse/all/tag/:tag",
      :code => '@tag = Tag.find_by_name(params[:tag])'
    )

  end

  def self.down

    route = PageRoute.find_by_name('Content with Tag')
    route.destroy if route

    page = Page.find_by_path('/content/by_tag')
    page.destroy if page

    route = PageRoute.find_by_name('Pages with Tag')
    route.destroy if route

    page = Page.find_by_path('/pages/by_tag')
    page.destroy if page

  end
end
