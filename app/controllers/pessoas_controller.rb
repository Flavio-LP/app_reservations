class PessoasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pessoa, only: [ :show, :update ]
  before_action :check_admin_access, only: [ :show ]

  def show
  end

  def edit
    # não criamos aqui, apenas preparamos objeto para o form
    @pessoa = current_user.pessoa || Pessoa.new
  end

  # novo endpoint para criação
  def create
    @pessoa = current_user.build_pessoa(pessoa_params)
    if @pessoa.save
      redirect_to root_path, notice: "Dados pessoais cadastrados com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update
    @pessoa = current_user.pessoa
    if @pessoa.update(pessoa_params)
      redirect_to root_path, notice: "Dados pessoais atualizados com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_pessoa
    @pessoa = current_user.pessoa
  end

  def check_admin_access
    redirect_to root_path, alert: "Acesso negado." if current_user.admin?
  end

  def pessoa_params
    params.require(:pessoa).permit(:nome, :sobrenome, :telefone, :cpf, :data_nascimento, :endereco)
  end
end
