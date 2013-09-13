class Call < ActiveRecord::Base
  validates_presence_of :dpto_id, message: "Departamento não pode ser vazio"
  validates_presence_of :servant_id, message: "Você não digitou seu nome" 
  validates_presence_of :equipment, message: "Um equipamento precisa ser descrito"
  validates_presence_of :problem, message: "Um problema precisa ser descrito"

  validates_presence_of :service, message: "A descrição do serviço realizado deve ser incluído.", on: :done
end