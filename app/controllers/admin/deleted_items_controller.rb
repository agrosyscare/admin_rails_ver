module Admin
  class DeletedItemsController < AdminController
    before_action :set_deleted_item, only: %i[ show ]

    def index
      authorize PaperTrail::Version
    end

    def datatable
      @versions = policy_scope(PaperTrail::Version).where(event: "destroy").order(created_at: :desc)

      respond_to do |format|
        format.json { render json: DeletedItemDatatable.new(params, collection: @versions, view_context: view_context) }
      end
    end

    def show
    end

    def restore
      @latest_version = policy_scope(PaperTrail::Version).find(params[:deleted_item_id])

      if @latest_version.event == "destroy"
        @version = @latest_version.reify
        if @version.save
          format.html { redirect_to admin_deleted_items_path, notice: PaperTrail::Version.human_notice(:restored) }
        else
          format.html { redirect_to admin_deleted_items_path, status: :unprocessable_entity }
        end
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_deleted_item
      @deleted_item = policy_scope(PaperTrail::Version).find(params[:id])
    end
  end
end
