module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin!

    def index
      # Lógica do painel admin
    end

    private

    def authorize_admin!
      redirect_to root_path, alert: "Acesso negado" unless current_user.admin?
    end
  end
end
