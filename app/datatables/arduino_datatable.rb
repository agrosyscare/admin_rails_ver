class ArduinoDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      id: { source: "Arduino.id", cond: :eq },
      model: { source: "Arduino.model", cond: :like },
      serial: { source: "Arduino.serial", cond: :like },
      buttons: { searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        model: record.model,
        serial: record.serial,
        buttons: dt_actions(record),

        DT_RowClass: dt_row_class(record)
      }
    end
  end

  protected
  def dt_actions(record)
    links = []

    if policy(record).show?
      links << link_to_show(view.admin_arduino_path(record))
    end

    if policy(record).edit?
      links << link_to_edit(view.edit_admin_arduino_path(record))
    end

    if policy(record).destroy?
      links << link_to_destroy(view.admin_arduino_path(record))
    end

    content_tag(:div, safe_join(links, ''), class: 'table-actions')
  end
end
