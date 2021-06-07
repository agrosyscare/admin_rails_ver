class FloorDecorator < ApplicationDecorator
  delegate_all

  def dt_actions
    links = []
    links << h.link_to_show(h.floor_path(object))
    links << h.link_to_edit(h.edit_floor_path(object))
    links << h.link_to_destroy(h.floor_path(object))

    h.content_tag(:div, h.safe_join(links, ' '), class: 'table-actions')
  end

end
