module Admin
  class ArduinosController < AdminController
    before_action :set_arduino, only: %i[ show edit update destroy ]

    # GET /arduinos or /arduinos.json
    def index
      authorize Arduino
    end

    def datatable
      @arduinos = policy_scope(Arduino)

      respond_to do |format|
        format.json { render json: ArduinoDatatable.new(params, collection: @arduinos, view_context: view_context) }
      end
    end

    # GET /arduinos/1 or /arduinos/1.json
    def show
      @versions = @arduino.versions
      @sensors = @arduino.sensors
    end

    # GET /arduinos/new
    def new
      @arduino = authorize Arduino.new
    end

    # GET /arduinos/1/edit
    def edit
    end

    # POST /arduinos or /arduinos.json
    def create
      @arduino = authorize Arduino.new(arduino_params)

      respond_to do |format|
        if @arduino.save
          format.html { redirect_to [:admin, @arduino], notice: Arduino.human_notice(:created) }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /arduinos/1 or /arduinos/1.json
    def update
      respond_to do |format|
        if @arduino.update(arduino_params)
          format.html { redirect_to [:admin, @arduino], notice: Arduino.human_notice(:updated) }
          format.json { render :show, status: :ok, location: @arduino }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /arduinos/1 or /arduinos/1.json
    def destroy
      @arduino.destroy
      respond_to do |format|
        format.html { redirect_to admin_arduinos_url, notice: Arduino.human_notice(:destroyed) }
      end
    end

    def rollback
      @arduino = policy_scope(Arduino).find(params[:arduino_id])
      version = @arduino.versions.find(params[:version])
      if version.reify.save
        redirect_to [:admin, @arduino], notice: Arduino.human_notice(:rollbacked)
      else
        render :show, error: Arduino.human_notice(:rollback)
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_arduino
        @arduino = policy_scope(Arduino).find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def arduino_params
        params.require(:arduino).permit(:model, :serial)
      end
  end
end
