require 'rails_helper'
require 'pry'

RSpec.feature "AdminPage", type: :feature do
  #et!(:admin_user) { User.create!(email: "flavio2@teste.com", password: "abc123654", admin: true) }

  scenario "admin faz login e vê a tela de administração" do
    # 1. Visitar a página de login primeiro
    visit new_user_session_path

    # 2. Preencher o formulário de login
    fill_in "Email", with: "flavio1@teste.com"
    # Usar "Password" como o localizador, que corresponde ao f.label :password no seu form
    fill_in "Password", with: "123456"
    
    # 3. Clicar no botão de submissão do formulário
    click_button "Entrar"

    expect(page).to have_css("h1", text: "Admin tela")
    # Você pode adicionar mais expectativas para garantir que a página correta foi carregada
    # expect(page).to have_content("Users list")
  end

  
    scenario "usuário comum faz login e vê a tela padrão" do
      visit new_user_session_path
      fill_in "Email", with: "flavio@teste.com"
      fill_in "Password", with: "123456"
      click_button "Entrar"
  
      expect(page).to have_css("h1", text: "Welcome to the Home Page")
    end

end