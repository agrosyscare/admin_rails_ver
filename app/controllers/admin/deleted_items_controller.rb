module Admin
  class DeletedItemsController < AdminController
    before_action :set_deleted_item, only: %i[ show ]

    def index
    end

    def datatable
      @versions = PaperTrail::Version.where(event: "destroy").order(created_at: :desc)

      respond_to do |format|
        format.json { render json: DeletedItemDatatable.new(params, collection: @versions, view_context: view_context) }
      end
    end

    def show
    end

    def restore
      @latest_version = PaperTrail::Version.find(params[:deleted_item_id])

      if @latest_version.event == "destroy"
        @version = @latest_version.reify
        if @version.save
          redirect_to admin_deleted_items_path, notice: "Version was successfully restored."
        else
          # render "deleted"
        end
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_deleted_item
      @deleted_item = PaperTrail::Version.find(params[:id])
    end
  end
end
