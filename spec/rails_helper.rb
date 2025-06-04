require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

# Adicionar estas gems no topo
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
require 'factory_bot_rails'
require 'devise'

# Configuração do RSpec
RSpec.configure do |config|
  # Configurações básicas
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  # Incluir helpers
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Capybara::DSL

  # Configurações de carregamento e filtro
  config.filter_rails_from_backtrace!
  config.filter_run_when_matching :focus

  # Manter rastro de exemplos
  config.example_status_persistence_file_path = "spec/examples.txt"
end

# Configuração do Capybara
Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'http://localhost:3000'
end

# Prevenir truncamento do banco de dados em produção
abort("The Rails environment is running in production mode!") if Rails.env.production?

# Manter schema do banco de dados
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end