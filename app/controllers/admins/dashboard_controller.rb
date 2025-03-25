class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    # dashboard do admin
  end
end
