module Admin
  class FloorsController < AdminController
    before_action :set_floor, only: [:show, :edit, :update, :destroy]

    # GET /floors or /floors.json
    def index
    end

    def datatable
      @floors = Floor.all

      respond_to do |format|
        format.json { render json: FloorDatatable.new(params, collection: @floors) }
      end
    end

    # GET /floors/1
    def show
      @versions = @floor.versions
    end

    # GET /floors/new
    def new
      @floor = Floor.new
    end

    # GET /floors/1/edit
    def edit
    end

    # POST /floors or /floors.json
    def create
      @floor = Floor.new(floor_params)

      respond_to do |format|
        if @floor.save
          format.html { redirect_to [:admin, @floor], notice: Floor.human_notice(:created)}
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /floors/1 or /floors/1.json
    def update
      respond_to do |format|
        if @floor.update(floor_params)
          format.html { redirect_to [:admin, @floor], notice: Floor.human_notice(:updated) }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /floors/1 or /floors/1.json
    def destroy
      @floor.destroy
      respond_to do |format|
        format.html { redirect_to admin_floors_url, notice: Floor.human_notice(:destroyed) }
      end
    end

    def rollback
      @floor = Floor.find(params[:floor_id])
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
        @floor = Floor.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def floor_params
        params.require(:floor).permit(:name, :plant_type, :greenhouse_id)
      end
  end

end
