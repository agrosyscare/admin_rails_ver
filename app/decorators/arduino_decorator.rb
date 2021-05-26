class ArduinoDecorator < ApplicationDecorator
  delegate_all

  def dt_actions
    links = []
    links << h.link_to('Show', h.arduino_path(object))
    links << h.link_to('Edit', h.edit_arduino_path(object))
    links << h.link_to('Delete', h.arduino_path(object), method: :delete, data: { confirm: 'Are you sure?' })

    h.content_tag(:div, h.safe_join(links, ' '), class: 'table-actions')
  end
end
