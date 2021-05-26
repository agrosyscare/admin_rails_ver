class FloorDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      id: { source: "Floor.id", cond: :eq },
      name: { source: "Floor.name", cond: :like },
      plant_type: { source: "Floor.plant_type", cond: :like },
      buttons: { sercheable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        plant_type: record.plant_type,
        buttons: record.decorate.dt_actions,

        DT_RowClass: dt_row_class(record)
      }
    end
  end

end
