module Api
  module V1
    class GreenhousesController < ApiController
      before_action :authenticate_user, only: [:index]

      def index
        greenhouses = Greenhouse.all
        render json: greenhouses
      end
    end
  end
end
