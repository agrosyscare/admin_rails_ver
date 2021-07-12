class ApplicationDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegator :view, :link_to
  def_delegator :view, :content_tag
  def_delegator :view, :safe_join
  def_delegator :view, :link_to_show
  def_delegator :view, :link_to_edit
  def_delegator :view, :link_to_destroy
  def_delegator :view, :link_to_chart
  def_delegator :view, :link_to_rollback
  def_delegator :view, :policy_scope
  def_delegator :view, :policy
  def_delegator :view, :l
  def_delegator :view, :t

  def get_raw_records
    @raw_records ||= options[:collection]
  end

  private
    def dt_row_class(record)
      ""
    end

    def dt_actions(record)
      nil
    end

    def view
      @view ||= options[:view_context]
    end
end
