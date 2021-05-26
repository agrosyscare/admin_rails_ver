class GreenhouseDecorator < Draper::Decorator
  delegate_all

  def dt_actions
    links = []
    links << h.link_to('Charts', h.charts_greenhouse_path(object))
    links << h.link_to('Show', h.greenhouse_path(object))
    links << h.link_to('Edit', h.edit_greenhouse_path(object))
    links << h.link_to('Delete', h.greenhouse_path(object), method: :delete, data: { confirm: 'Are you sure?' })

    h.content_tag(:div, h.safe_join(links, ' '), class: 'table-actions')
  end

end
