class ApplicationController < ActionController::Base
  # include RequireCompleteProfile
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    if resource.needs_to_complete_profile?
      edit_pessoa_path
    else
      super
    end
  end
end
