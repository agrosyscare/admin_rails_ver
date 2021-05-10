class GreenhouseDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      id: { source: "Greenhouse.id", cond: :eq },
      name: { source: "Greenhouse.name", cond: :like },
      description: { source: "Greenhouse.description", cond: :like },
      buttons: { sercheable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        description: record.description,
        buttons: record.decorate.dt_actions,

        DT_RowClass: dt_row_class(record)
      }
    end
  end

end
