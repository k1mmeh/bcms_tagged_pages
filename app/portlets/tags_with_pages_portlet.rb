class TagsWithPagesPortlet < Portlet

  LAYOUTS = [
    ['Cloud', 'cloud'],
    ['List', 'list']
  ]

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor true

  # find tags that have pages assigned to them
  def render
    # params[:tag] should have been specified if this portlet is being rendered!
    @tags = []
    valid_orderings = {
      'name' => 'tags.name ASC',
      'popular' => 'count DESC',
      'random' => 'random()'
    }
    order_param = valid_orderings.keys.include?(@portlet.order) ? @portlet.order : 'name'
    order_string = valid_orderings[order_param]
    limit = @portlet.number_of_pages.to_i > 0 ? @portlet.number_of_tags.to_i : nil
    @sizes = @portlet.weighting_sizes.to_s.split(/\s+/)

    case @portlet.layout
    when 'cloud'
      @partial = 'cloud'
    else # layout == 'list'
      
    end
    @partial = @portlet.layout
    @tags = Tag.cloud(
      :conditions => ["taggings.taggable_type = 'Page'"],
      :having => 'count > 0',
      :order => order_string, :limit => limit,
      :sizes => @sizes.length
    )
  end
    
end