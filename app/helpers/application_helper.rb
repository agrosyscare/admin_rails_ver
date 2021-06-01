module ApplicationHelper
  def link_to_back(url, options={})
    title = options[:title] || t(:back, scope: [:views, :buttons])
    icon = options[:icon] || 'arrow_back'
    link_to url, data: {toggle: "tooltip", animation: false}, title: title do
      content_tag(:i, icon, class: "material-icons pull-right", style: "color:#ffff")
    end
  end

  def link_to_chart(url, options={})
    title = options[:title] || t(:charts, scope: [:views, :buttons])
    icon = options[:icon] || 'auto_graph'
    link_to url, data: {toggle: "tooltip", animation: false}, title: title do
      content_tag(:i, icon, class: "material-icons", style: "color:#00bcd4")
    end
  end

  def link_to_new(url, options={})
    title = options[:title] || t(:new, scope: [:views, :buttons])
    icon = options[:icon] || 'add'
    link_to url, data: {toggle: "tooltip", animation: false}, title: title do
      content_tag(:i, icon, class: "material-icons pull-right")
    end
  end

  def link_to_show(url, options={})
    title = options[:title] || t(:show, scope: [:views, :buttons])
    icon = options[:icon] || 'details'
    link_to url, data: {toggle: "tooltip", animation: false}, title: title do
      content_tag(:i, icon, class: "material-icons", style: "color:#00bcd4")
    end
  end

  def link_to_edit(url, options={})
    title = options[:title] || t(:edit, scope: [:views, :buttons])
    icon = options[:icon] || 'edit'
    link_to url, data: { toggle: "tooltip", animation: false }, title: title do
      content_tag(:i, icon, class: "material-icons")
    end
  end

  def link_to_destroy(url, options={})
    title = options[:title] || t(:destroy, scope: [:views, :buttons])
    confirm = options[:confirm] || t(:destroy, scope: [:views, :confirmations])
    icon = options[:icon] || 'close'
    link_to url, data: { confirm: confirm, toggle: "tooltip", animation: false }, method: :delete, title: title do
      content_tag(:i, icon, class: "material-icons", style: "color:red")
    end
  end
end
