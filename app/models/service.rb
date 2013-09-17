class Service < ActiveRecord::Base
  has_many :calls
  validates_presence_of :service, message: "O serviço precisa ser descrito."
  validates_presence_of :priority, message: "A prioridade precisa ser escolhida."
end
