class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :pessoa, dependent: :destroy

  # Método para verificar se precisa completar dados pessoais
  def needs_to_complete_profile?
    !admin? && (pessoa.nil? || !pessoa.dados_completos?)
  end

  # Método para criar pessoa no primeiro acesso
  def ensure_pessoa_exists
    return if pessoa.present?
    puts pessoa.inspect
    create_pessoa(nome: "", sobrenome: "", dados_completos: false)
  rescue ActiveRecord::RecordInvalid
    # Se falhar, cria um registro básico
    Pessoa.create(user: self, nome: "", sobrenome: "", dados_completos: false)
  end
end
