module RequireCompleteProfile
  extend ActiveSupport::Concern

  included do
    before_action :ensure_profile_complete, unless: :devise_controller?
  end

  private

  def ensure_profile_complete
    if user_signed_in? && current_user.needs_to_complete_profile?
      unless controller_name == "pessoas" && action_name.in?([ "edit", "update" ])
        redirect_to edit_pessoa_path, alert: "Por favor, complete seus dados pessoais para continuar."
      end
    end
  end
end
