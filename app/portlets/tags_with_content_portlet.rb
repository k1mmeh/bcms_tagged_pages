class TagsWithContentPortlet < Portlet

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
      @partial = 'list'
    end

    # this is a bit trickier than TagsWithPagesPortlet.  We need to find any content
    # that is tagged by @tag but is also a connectable for a visible page.
    visible_conn_query = <<QQ
SELECT NULL FROM connectors
  INNER JOIN pages ON pages.id = connectors.page_id
    WHERE connectors.connectable_id = taggings.taggable_id AND
      connectors.connectable_type = taggings.taggable_type AND
      connectors.page_version = pages.version
QQ

    # check if we want to include pages in this result set first
    if @portlet.include_pages == '1'
      conditions = "taggings.taggable_type = 'Page' OR EXISTS (#{visible_conn_query})"
    else
      conditions = "EXISTS (#{visible_conn_query})"
    end
    
    @tags = Tag.cloud(
      :conditions => conditions,
      :having => 'count > 0',
      :order => order_string, :limit => limit,
      :sizes => @sizes.length
    )
  end
    
end