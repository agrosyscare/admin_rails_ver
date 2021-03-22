module Api
  module V1
    class TemperatureReadingsController < ApiController
      def create
        temperature_reading = TemperatureReading.new(EnvironmentalConditionForm.transform(temperature_reading_params))

        if temperature_reading.save
          render json: temperature_reading, status: :ok
        else
          render json: { error: 'Ha habido un error' }
        end
      end

      private

      def temperature_reading_params
        params.permit(:reading, :status, :sensor_id)
      end
    end
  end
end
