class ApplicationDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :view, :number_to_percentage
  def_delegator :view, :number_to_currency
  def_delegator :view, :number_with_delimiter
  def_delegator :view, :link_to
  def_delegator :view, :l
  def_delegator :view, :t
  def_delegator :view, :image_tag
  def_delegator :view, :content_tag
  def_delegator :view, :safe_join
  def_delegator :view, :rails_blob_path
  def_delegator :view, :link_to_show
  def_delegator :view, :link_to_edit
  def_delegator :view, :link_to_destroy
  def_delegator :view, :link_to_switch
  def_delegator :view, :boolean
  def_delegator :view, :policy
  def_delegator :view, :timepicker_format
  def_delegator :view, :dom_id
  def_delegator :view, :simple_format

  def get_raw_records
    @raw_records ||= options[:collection]
  end

  def view
    @view ||= options[:view_context]
  end

  private
    def dt_row_class(record)
      ""
    end

    def dt_actions(record)
      nil
    end
end
