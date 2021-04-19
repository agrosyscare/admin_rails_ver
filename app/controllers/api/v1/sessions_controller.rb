module Api
  module V1
    class SessionsController < ActionController::API
      class AuthenticationError < StandardError; end

      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      rescue_from AuthenticationError, with: :handle_unauthenticated

      def login
        raise AuthenticationError unless user.valid_password?(params.require(:password))

        token = AuthenticationTokenService.encode(user.id)

        render json: {
          error: false,
          access_token: token,
          token_type: 'Bearer'
        }, status: :created
      end

      def logout
        render json: { error: false, message: 'Successfully logged out' }
      end

      private

      def user
        @user ||= User.find_by(email: params.require(:email))
      end

      def parameter_missing(error)
        render json: { error: error.message }, status: :unprocessable_entity
      end

      def handle_unauthenticated
        head :unauthorized
      end
    end
  end
end
