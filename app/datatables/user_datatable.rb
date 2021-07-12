class UserDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      id: { source: "User.id", cond: :eq },
      rut: { source: "User.rut", cond: :like },
      firstname: { source: "User.firstname", cond: :like },
      lastname: { source: "User.lastname", cond: :like },
      email: { source: "User.email", cond: :like },
      buttons: { searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        rut: record.rut,
        firstname: record.firstname,
        lastname: record.lastname,
        email: record.email,
        buttons: dt_actions(record),

        DT_RowClass: dt_row_class(record)
      }
    end
  end

  protected
  def dt_actions(record)
    links = []

    if policy(record).show?
      links << link_to_show(view.admin_user_path(record))
    end

    if policy(record).edit?
      links << link_to_edit(view.edit_admin_user_path(record))
    end

    if policy(record).destroy?
      links << link_to_destroy(view.admin_user_path(record))
    end

    content_tag(:div, safe_join(links, ''), class: 'table-actions')
  end
end
