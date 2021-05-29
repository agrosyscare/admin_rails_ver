class GreenhouseDecorator < Draper::Decorator
  delegate_all

  def dt_actions
    links = []
    links << h.link_to_chart(h.charts_greenhouse_path(object))
    links << h.link_to_show(h.greenhouse_path(object))
    links << h.link_to_edit(h.edit_greenhouse_path(object))
    links << h.link_to_destroy(h.greenhouse_path(object))

    h.content_tag(:div, h.safe_join(links, ' '), class: 'table-actions')
  end
end
