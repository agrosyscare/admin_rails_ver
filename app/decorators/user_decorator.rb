class UserDecorator < ApplicationDecorator
  delegate_all

  def dt_actions
    links = []
    links << h.link_to_edit(h.edit_user_path(object))
    links << h.link_to_destroy(h.user_path(object))

    h.content_tag(:div, h.safe_join(links, ' '), class: 'table-actions')
  end
end
