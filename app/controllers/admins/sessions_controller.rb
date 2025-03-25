# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # def after_sign_in_path_for(resource)
  #  admin_root_path # ou onde quiser redirecionar o admin
  # end

  def new
    # Renderiza a página de login
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Login realizado com sucesso!"
    else
      flash.now[:alert] = "Email ou senha inválidos."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logout realizado com sucesso!"
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
