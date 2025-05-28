# App Reservations 🍕

Este projeto é uma aplicação Ruby on Rails para gerenciamento de reservas, com autenticação de usuários utilizando [Devise](https://github.com/heartcombo/devise). 

O sistema diferencia usuários comuns de administradores através de uma flag personalizada.

## Funcionalidades

- Cadastro e login de usuários com Devise
- Diferenciação entre usuários comuns e administradores por meio do campo booleano `admin` na tabela `users`
- Renderização de telas diferentes para administradores e usuários comuns após o login
- Logout seguro

## Como funciona o escopo de admin

- O campo `admin` é um booleano na tabela `users`, criado via migration.
- Por padrão, todo novo usuário tem `admin: false`.
- Para tornar um usuário administrador, altere o valor do campo `admin` para `true` diretamente no banco de dados.
- Usuários com `admin: true` visualizam uma tela exclusiva de administração ao acessar a home.

## Instalação

1. **Clone o repositório:**
   ```sh
   git clone https://github.com/Flavio-LP/app_reservations.git
   cd app_reservations 
   
2. **Instale as depedências e configure o banco de dados**
   ```sh
   bundle install
   rails db:create db:migrate

3. **Inicie a aplicação**
   ```sh
   rails server
   ```

4. **Acesse a aplicação:**

    * Usuários comuns verão a tela padrão.
    * Usuários administradores verão a tela de administração.
