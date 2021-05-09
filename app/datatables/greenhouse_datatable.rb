class GreenhouseDatatable < AjaxDatatablesRails::ActiveRecord

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
        description: record.description
      }
    end
  end

  def get_raw_records
    Greenhouse.all
  end

end
