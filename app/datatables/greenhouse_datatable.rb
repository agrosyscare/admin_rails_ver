class GreenhouseDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      id: { source: "Greenhouse.id", cond: :eq },
      name: { source: "Greenhouse.name", cond: :like },
      description: { source: "Greenhouse.description", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        description: record.description,
        DT_RowId: record.id
      }
    end
  end
end
