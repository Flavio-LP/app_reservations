class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user, :user_signed_in?

  private

  # Método para verificar se o usuário está autenticado
  def authenticate_user!
    unless user_signed_in?
      redirect_to login_path, alert: "Você precisa estar logado para acessar esta página."
    end
  end

  # Método para obter o usuário atual (simulação)
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Método para verificar se o usuário está logado
  def user_signed_in?
    current_user.present?
  end
end
