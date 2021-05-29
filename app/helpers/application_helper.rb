module ApplicationHelper
  # def link_to_list(url, options={})
  #   title = options[:title] || t(:list, scope: [:views, :buttons])
  #   icon = options[:icon] || 'fas fa-list'
  #   link_to url, data: {toggle: "tooltip", animation: false}, title: title do
  #     content_tag(:i, '', class: "#{icon} px-1")
  #   end
  # end

  def link_to_chart(url, options={})
    title = options[:title] || t(:list, scope: [:views, :buttons])
    icon = options[:icon] || 'auto_graph'
    link_to url, data: {toggle: "tooltip", animation: false}, title: title do
      content_tag(:i, icon, class: "material-icons", style: "color:purple")
    end
  end

  def link_to_new(url, options={})
    title = options[:title] || t(:new, scope: [:views, :buttons])
    icon = options[:icon] || 'add'
    link_to url, data: {toggle: "tooltip", animation: false}, title: title do
      content_tag(:i, icon, class: "material-icons")
    end
  end

  def link_to_show(url, options={})
    title = options[:title] || t(:show, scope: [:views, :buttons])
    icon = options[:icon] || 'person'
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

  # def link_to_reload(url, options={})
  #   title = options[:title] || t(:reload, scope: [:views, :buttons])
  #   icon = options[:icon] || 'fas fa-sync'
  #   link_to url, data: {toggle: "tooltip", animation: false}, title: title do
  #     content_tag(:i, '', class: "#{icon} px-1")
  #   end
  # end

  # def link_to_back(url, options={})
  #   title = options[:title] || t(:back, scope: [:views, :buttons])
  #   icon = options[:icon] || 'fas fa-chevron-left'
  #   link_to url, data: {toggle: "tooltip", animation: false}, title: title do
  #     content_tag(:i, '', class: "#{icon} px-1")
  #   end
  # end

  # def link_to_switch(url, options={active: true})
  #   title = options[:title] || options[:active] ? t(:switch_off, scope: [:views, :buttons]) : t(:switch_on, scope: [:views, :buttons])
  #   icon = options[:icon] || options[:active] ? 'fas fa-toggle-on' : 'fas fa-toggle-off'
  #   confirm = options[:confirm] || options[:active] ? t(:switch_off, scope: [:views, :confirmations]) : t(:switch_on, scope: [:views, :confirmations])
  #   link_to url, data: { confirm: confirm, toggle: "tooltip", animation: false }, title: title do
  #     content_tag(:i, '', class: "#{icon} px-1")
  #   end
  # end
end
