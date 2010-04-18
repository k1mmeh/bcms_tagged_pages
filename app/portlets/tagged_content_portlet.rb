class TaggedContentPortlet < Portlet

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor true

  def render
    # tag should already be defined, but if not, try params[:tag]
    @tag ||= Tag.find_by_name(params[:tag])
    @taggings = []
    return unless @tag

    per_page = @portlet.per_page.to_i > 0 ? @portlet.per_page.to_i : 5
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    @items = Tagging.paginate(:all,
      :conditions => ["taggings.tag_id = ? AND (taggings.taggable_type = 'Page' OR EXISTS (SELECT NULL FROM connectors INNER JOIN pages ON pages.id = connectors.page_id WHERE connectors.page_id = taggings.taggable_id AND connectors.page_version = pages.version))", @tag.id],
      :order => 'taggings.created_at DESC',
      :per_page => per_page, :page => page
    )
    
    @items.replace(@items.map(&:taggable))
  end

end