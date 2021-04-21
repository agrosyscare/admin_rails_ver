module Api
  module V1
    class FirebaseController < ApiController
      before_action :authenticate_user, only: [:update]

      def update
        user = User.find_by(id: authenticate_user.id)

        user.update!(device_params) if params[:device_token].present?
      end

      private

      def device_params
        params.permit(:device_token)
      end
    end
  end
end
