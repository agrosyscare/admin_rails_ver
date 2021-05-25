class FloorDecorator < ApplicationDecorator
  delegate_all

  def dt_actions
    links = []
    links << h.link_to('Show', h.floor_path(object))
    links << h.link_to('Edit', h.edit_floor_path(object))
    links << h.link_to('Delete', h.floor_path(object), method: :delete, data: { confirm: 'Are you sure?' })

    h.content_tag(:div, h.safe_join(links, ' '), class: 'table-actions')
  end

end
