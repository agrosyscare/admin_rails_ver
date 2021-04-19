module Api
  module V1
    class TemperatureReadingsController < ApiController
      def index
        lecture = TemperatureReading.select(:id, :reading, :status)
                                    .joins(:sensor).where('sensors.floor_id =?', params[:floor_id])
                                    .last

        render json: lecture
      end

      def create
        temperature_reading = TemperatureReading.new(ReadingForm.transform(temperature_reading_params))

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
