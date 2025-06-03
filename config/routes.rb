Rails.application.routes.draw do
  devise_for :users, controllers: { passwords: "users/passwords" }
  root "home#index"

  devise_scope :user do
    post "custom_password_reset", to: "users/passwords#custom_reset", as: :custom_password_reset
  end
end
