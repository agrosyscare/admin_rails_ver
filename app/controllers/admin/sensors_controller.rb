module Admin
  class SensorsController < AdminController
    before_action :set_sensor, only: %i[ edit update destroy ]

    # GET /sensors/new
    def new
      @sensor = authorize Sensor.new
    end

    # GET /sensors/1/edit
    def edit
    end

    # POST /sensors or /sensors.json
    def create
      @sensor = authorize Sensor.new(sensor_params)

      respond_to do |format|
        if @sensor.save
          format.html { redirect_to [:admin, @sensor.arduino], notice: Sensor.human_notice(:created) }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /sensors/1 or /sensors/1.json
    def update
      respond_to do |format|
        if @sensor.update(sensor_params)
          format.html { redirect_to [:admin, @sensor.arduino], notice: Sensor.human_notice(:updated) }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /sensors/1 or /sensors/1.json
    def destroy
      @sensor.destroy
      respond_to do |format|
        format.html { redirect_to [:admin, @sensor.arduino], notice: Sensor.human_notice(:destroyed) }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_sensor
        @sensor = policy_scope(Sensor).find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def sensor_params
        params.require(:sensor).permit(:model, :serial, :environmental_condition_id, :floor_id ,:arduino_id)
      end
  end

end
