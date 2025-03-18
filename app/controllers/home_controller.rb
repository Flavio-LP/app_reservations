class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    # Aqui você pode colocar a lógica de direcionamento
    if current_user.admin?
      redirect_to admin_dashboard_path
    else
      redirect_to user_dashboard_path
    end
  end
end
