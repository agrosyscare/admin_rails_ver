class ArduinoDecorator < ApplicationDecorator
  delegate_all

  def dt_actions
    links = []
    links << h.link_to_show(h.admin_arduino_path(object))
    links << h.link_to_edit(h.edit_admin_arduino_path(object))
    links << h.link_to_destroy(h.admin_arduino_path(object))

    h.content_tag(:div, h.safe_join(links, ' '), class: 'table-actions')
  end
end
