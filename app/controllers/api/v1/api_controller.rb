module Api
  module V1
    class ApiController < ActionController::API
      include ActionController::HttpAuthentication::Token
      private

      def authenticate_user
        token, _options = token_and_options(request)
        if token.nil?
          head :unauthorized
        else
          user_id = AuthenticationTokenService.decode(token)
          User.find(user_id)
        end
      rescue ActiveRecord::RecordNotFound
        render status: :unauthorized
      end
    end
  end
end
