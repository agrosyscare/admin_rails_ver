module Api
  module V1
    class FloorsController < ApiController
      before_action :authenticate_user, only: [:index]

      def index
        floors = Floor.where(greenhouse_id: params[:greenhouse_id])
        render json: floors
      end
    end
  end
end
