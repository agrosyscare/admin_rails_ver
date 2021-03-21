module Api
  module V1
    class TemperatureReadingsController < ApiController
      def index
        temperature_readings = TemperatureReading.all
        render json: temperature_readings
      end

      def create
        @temperature_reading = TemperatureReadings.new(params[:object])
        if @temperature_reading.save
          flash[:success] = 'Object successfully created'
        else
          flash[:error] = 'Something went wrong'
        end
      end
    end
  end
end
