module Api
  module V1
    class GreenhousesController < ApiController
      def index
        greenhouses = Greenhouse.all
        render json: greenhouses
      end
    end
  end
end
