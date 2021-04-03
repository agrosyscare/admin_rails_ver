module Api
  module V1
    class FloorsController < ApiController
      def index
        floors = Floor.find_by(greenhouse_id: params[:greenhouse_id])
        render json: floors
      end
    end
  end
end
