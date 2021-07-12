module Admin
  class FloorsController < AdminController
    before_action :set_floor, only: [:show, :edit, :update, :destroy]

    # GET /floors
    def index
      authorize Floor
    end

    def datatable
      @floors = policy_scope(Floor)

      respond_to do |format|
        format.json { render json: FloorDatatable.new(params, collection: @floors, view_context: view_context) }
      end
    end

    # GET /floors/1
    def show
      @versions = @floor.versions
    end

    # GET /floors/new
    def new
      @floor = authorize Floor.new
    end

    # GET /floors/1/edit
    def edit
    end

    # POST /floors
    def create
      @floor = authorize Floor.new(floor_params)

      respond_to do |format|
        if @floor.save
          format.html { redirect_to [:admin, @floor], notice: Floor.human_notice(:created)}
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /floors/1
    def update
      respond_to do |format|
        if @floor.update(floor_params)
          format.html { redirect_to [:admin, @floor], notice: Floor.human_notice(:updated) }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /floors/1
    def destroy
      @floor.destroy
      respond_to do |format|
        format.html { redirect_to admin_floors_url, notice: Floor.human_notice(:destroyed) }
      end
    end

    def rollback
      @floor = policy_scope(Floor).find(params[:floor_id])
      version = @floor.versions.find(params[:version])
      if version.reify.save
        redirect_to [:admin, @floor], notice: Floor.human_notice(:rollbacked)
      else
        render :show, error: Floor.human_notice(:rollbacked)
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_floor
        @floor = policy_scope(Floor).find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def floor_params
        params.require(:floor).permit(:name, :plant_type, :greenhouse_id)
      end
  end

end
