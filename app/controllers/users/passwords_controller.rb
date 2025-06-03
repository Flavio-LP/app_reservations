# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  def custom_reset
    user = User.find_by(email: params[:email])
    puts user
    if user
      user.password = "abc123654"
      user.password_confirmation = "abc123654"
      user.save(validate: false)
      flash[:notice] = "Senha redefinida para abc123654"
      redirect_to new_user_session_path
    else
      flash[:alert] = "E-mail não encontrado"
      redirect_to new_user_password_path
    end
  end
end
