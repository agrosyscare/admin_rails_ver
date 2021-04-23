module Api
  module V1
    class HumidityReadingsController < ApiController
      def index
        lecture = HumidityReading.select(:id, :reading, :status)
                                 .joins(:sensor).where('sensors.floor_id =?', params[:floor_id])
                                 .last

        render json: lecture
      end

      def create
        if Sensor.find(params[:sensor_id]).environmental_condition.name == 'Humedad Ambiental'
          humidity_reading = HumidityReading.new(ReadingForm.transform(humidity_reading_params))
          send_notification(humidity_reading) if humidity_reading.status != 'Normal'

          if humidity_reading.save
            render json: humidity_reading, status: :ok
          else
            render json: { error: 'Ha habido un error' }
          end
        else
          render json: { error: 'Ha habido un error' }
        end
      end

      private

      def humidity_reading_params
        params.permit(:reading, :status, :sensor_id)
      end
    end
  end
end
