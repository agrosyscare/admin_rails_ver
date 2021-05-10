class ApplicationDatatable < AjaxDatatablesRails::ActiveRecord

  def get_raw_records
    @raw_records ||= options[:collection]
  end

  private
    def dt_row_class(record)
      ""
    end
end
