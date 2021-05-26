class UserDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      id: { source: "User.id", cond: :eq },
      email: { source: "User.email", cond: :like },
      buttons: { sercheable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        email: record.email,
        buttons: record.decorate.dt_actions,

        DT_RowClass: dt_row_class(record)
      }
    end
  end

end
