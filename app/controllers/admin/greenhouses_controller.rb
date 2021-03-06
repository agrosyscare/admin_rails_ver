module Admin
  class GreenhousesController < AdminController
    before_action :set_greenhouse, only: %i[ show edit update destroy ]

    # GET /greenhouses or /greenhouses.json
    def index
      authorize Greenhouse
    end

    def datatable
      @greenhouses = policy_scope(Greenhouse)

      respond_to do |format|
        format.json { render json: GreenhouseDatatable.new(params, collection: @greenhouses, view_context: view_context) }
      end
    end

    # GET /greenhouses/1
    def show
      @versions = @greenhouse.versions
    end

    # GET /greenhouses/new
    def new
      @greenhouse = authorize Greenhouse.new
    end

    # GET /greenhouses/1/edit
    def edit
    end

    # POST /greenhouses or /greenhouses.json
    def create
      @greenhouse = authorize Greenhouse.new(greenhouse_params)

      respond_to do |format|
        if @greenhouse.save
          format.html { redirect_to [:admin, @greenhouse], notice: Greenhouse.human_notice(:created) }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /greenhouses/1 or /greenhouses/1.json
    def update
      respond_to do |format|
        if @greenhouse.update(greenhouse_params)
          format.html { redirect_to [:admin, @greenhouse], notice: Greenhouse.human_notice(:updated) }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /greenhouses/1 or /greenhouses/1.json
    def destroy
      @greenhouse.destroy
      respond_to do |format|
        format.html { redirect_to admin_greenhouses_url, notice: Greenhouse.human_notice(:destroyed) }
      end
    end

    def rollback
      @greenhouse = policy_scope(Greenhouse).find(params[:greenhouse_id])
      version = @greenhouse.versions.find(params[:version])
      if version.reify.save
        redirect_to [:admin, @greenhouse], notice: Greenhouse.human_notice(:rollbacked)
      else
        render :show, error: Greenhouse.human_notice(:rollback)
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_greenhouse
        @greenhouse = policy_scope(Greenhouse).find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def greenhouse_params
        params.require(:greenhouse).permit(:name, :description)
      end
  end

end
