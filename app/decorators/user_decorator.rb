class UserDecorator < ApplicationDecorator
  delegate_all

  def dt_actions
    links = []
    links << h.link_to('Show', h.user_path(object))
    links << h.link_to('Edit', h.edit_user_path(object))
    links << h.link_to('Delete', h.user_path(object), method: :delete, data: { confirm: 'Are you sure?' })

    h.content_tag(:div, h.safe_join(links, ' '), class: 'table-actions')
  end
end
