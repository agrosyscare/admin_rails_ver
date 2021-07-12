class GreenhouseDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      id: { source: "Greenhouse.id", cond: :eq },
      name: { source: "Greenhouse.name", cond: :like },
      description: { source: "Greenhouse.description", cond: :like },
      buttons: { searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        description: record.description,
        buttons: dt_actions(record),

        DT_RowClass: dt_row_class(record)
      }
    end
  end

  protected
  def dt_actions(record)
    links = []

    if policy(record).show?
      links << link_to_show(view.admin_greenhouse_path(record))
    end

    links << link_to_chart(view.charts_admin_greenhouse_path(record))

    if policy(record).edit?
      links << link_to_edit(view.edit_admin_greenhouse_path(record))
    end

    if policy(record).destroy?
      links << link_to_destroy(view.admin_greenhouse_path(record))
    end

    content_tag(:div, safe_join(links, ''), class: 'table-actions')
  end
end
