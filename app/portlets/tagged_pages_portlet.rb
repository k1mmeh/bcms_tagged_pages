class TaggedPagesPortlet < Portlet

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor true

  def render
    # tag should already be defined, but if not, try params[:tag]
    @tag ||= Tag.find_by_name(params[:tag])
    @pages = []
    return unless @tag

    per_page = @portlet.per_page.to_i > 0 ? @portlet.per_page.to_i : 5
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    @pages = Tagging.paginate(:all,
      :select => 'taggings.*', :joins => 'INNER JOIN pages ON pages.id = taggings.taggable_id',
      :conditions => ['taggings.tag_id = ? AND taggings.taggable_type = ?', @tag.id, 'Page'],
      :order => 'pages.created_at DESC',
      :per_page => per_page, :page => page
    )
    @pages.replace(@pages.entries.map(&:taggable))
  end
    
end