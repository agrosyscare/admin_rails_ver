module Api
  module V1
    class RootMoistureReadingsController < ApiController

      def index
        lecture = RootMoistureReading.select(:id, :reading, :status)
                                    .joins(:sensor).where('sensors.floor_id =?', params[:floor_id])
                                    .last

        render json: lecture
      end

      def create
        root_moisture_reading = RootMoistureReading.new(ReadingForm.transform(root_moisture_reading_params))

        if root_moisture_reading.save
          render json: root_moisture_reading, status: :ok
        else
          render json: { error: 'Ha habido un error' }
        end
      end

      private

      def root_moisture_reading_params
        params.permit(:reading, :status, :sensor_id)
      end
    end
  end
end
