class User::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # Aqui vai a lógica da dashboard do usuário normal
  end
end
