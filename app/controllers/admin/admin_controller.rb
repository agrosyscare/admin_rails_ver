module Admin
  class AdminController < ActionController::Base
    before_action :authenticate_user!, :set_paper_trail_whodunnit
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
      flash[:alert] = "No estás autorizado para realizar esta acción"
      redirect_to(request.referrer || root_path)
    end

    def user_for_paper_trail
      user_signed_in? ? current_user.email : 'Public user'
    end

  end
end
