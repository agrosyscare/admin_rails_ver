module Api
  module V1
    class SessionsController < ApiController
      def sign_in
        user = User.find_by(email: params[:email])

        if user.valid_password?(params[:password])
          render json: { error: false, access_token: { token: 'asdasdasd' }, token_type: 'Bearer', expires_at: 'Fecha' },
                 status: :created
        else
          render json: { error: true, message: 'Unauthorized' }, status: :unauthorized
        end
      end
    end
  end
end
