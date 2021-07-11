class FloorDecorator < ApplicationDecorator
  delegate_all

  def dt_actions
    links = []
    links << h.link_to_show(h.admin_floor_path(object))
    links << h.link_to_show(h.admin_environmental_settings_path(floor_id: object.id),
      icon: 'settings',
      title: I18n.t(:environmental_settings, scope: [:views, :buttons]),
      style: "color:#694A38")
    links << h.link_to_edit(h.edit_admin_floor_path(object))
    links << h.link_to_destroy(h.admin_floor_path(object))

    h.content_tag(:div, h.safe_join(links, ' '), class: 'table-actions')
  end

end
