class Call < ActiveRecord::Base
  belongs_to :service
  validates_presence_of :dpto_id, message: "Departamento não pode ser vazio"
  validates_presence_of :servant_id, message: "Você não digitou seu nome" 
  validates_presence_of :service_id, message: "Um problema precisa ser escolhido"
  validates_presence_of :problem, message: "Um problema precisa ser descrito"
  validates_presence_of :service, message: "A descrição do serviço realizado deve ser incluído.", on: :done
end