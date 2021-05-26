class ArduinoDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      id: { source: "Arduino.id", cond: :eq },
      model: { source: "Arduino.model", cond: :like },
      serial: { source: "Arduino.serial", cond: :like },
      buttons: { sercheable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        model: record.model,
        serial: record.serial,
        buttons: record.decorate.dt_actions,

        DT_RowClass: dt_row_class(record)
      }
    end
  end

end
