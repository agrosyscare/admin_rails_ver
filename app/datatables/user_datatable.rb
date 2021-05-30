class UserDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      id: { source: "User.id", cond: :eq },
      rut: { source: "User.rut", cond: :like },
      firstname: { source: "User.firstname", cond: :like },
      lastname: { source: "User.lastname", cond: :like },
      email: { source: "User.email", cond: :like },
      buttons: { sercheable: false, orderable: false }
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
        buttons: record.decorate.dt_actions,

        DT_RowClass: dt_row_class(record)
      }
    end
  end

end
