class Pessoa < ApplicationRecord
  belongs_to :user

  validates :nome, presence: true, length: { minimum: 2 }
  validates :sobrenome, presence: true, length: { minimum: 2 }
  # Corrigindo a mensagem para aceitar 5 dígitos no meio do telefone
  validates :telefone, presence: true, format: { with: /\A\(\d{2}\)\s\d{4,5}-\d{4}\z/, message: "deve estar no formato (XX) XXXXX-XXXX" }
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/, message: "deve estar no formato XXX.XXX.XXX-XX" }
  validates :data_nascimento, presence: true
  validates :endereco, presence: true, length: { minimum: 10 }

  # Callback para marcar dados como completos quando todos os campos obrigatórios estão preenchidos
  before_save :check_dados_completos

  private

  def check_dados_completos
    self.dados_completos = nome.present? && sobrenome.present? && telefone.present? &&
                          cpf.present? && data_nascimento.present? && endereco.present?
  end
end
