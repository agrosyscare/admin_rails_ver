class InvitationsController < Devise::InvitationsController

  def after_invite_path_for(resource)
    admin_users_path
  end

  def after_accept_path_for(resource)
    admin_root_path
  end

  protected

  def update_resource_params
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:rut, :firstname, :lastname])
    devise_parameter_sanitizer.sanitize(:accept_invitation)
  end
end
