class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || admin_root_path
  end
end
