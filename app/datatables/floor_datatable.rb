class FloorDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      id: { source: "Floor.id", cond: :eq },
      name: { source: "Floor.name", cond: :like },
      plant_type: { source: "Floor.plant_type", cond: :like },
      buttons: { searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        plant_type: record.plant_type,
        buttons: dt_actions(record),

        DT_RowClass: dt_row_class(record)
      }
    end
  end

  protected
  def dt_actions(record)
    links = []

    links << link_to_show(view.admin_environmental_settings_path(floor_id: record.id), icon: 'settings', title: I18n.t(:environmental_settings, scope: [:views, :buttons]), style: "color:#694A38")

    if policy(record).show?
      links << link_to_show(view.admin_floor_path(record))
    end

    if policy(record).edit?
      links << link_to_edit(view.edit_admin_floor_path(record))
    end

    if policy(record).destroy?
      links << link_to_destroy(view.admin_floor_path(record))
    end

    content_tag(:div, safe_join(links, ''), class: 'table-actions')
  end
end
