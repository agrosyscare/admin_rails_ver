class DeletedItemDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      id: { source: "PaperTrail::Version.id", cond: :eq },
      item_type: { source: "PaperTrail::Version.item_type", cond: :like },
      whodunnit: { source: "PaperTrail::Version.whodunnit", cond: :like },
      created_at: { source: "PaperTrail::Version.created_at", cond: :like },
      buttons: { searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        item_type: record.item_type,
        whodunnit: record.whodunnit,
        created_at: l(record.created_at, format: :datetime),
        buttons: dt_actions(record),

        DT_RowClass: dt_row_class(record)
      }
    end
  end

  protected
  def dt_actions(record)
    links = []

    links << link_to_show(view.admin_deleted_item_path(record))
    links << link_to_rollback(view.admin_deleted_item_restore_path(record))
    # if policy(record).show?
    # end

    content_tag(:div, safe_join(links, ''), class: 'table-actions')
  end
end
