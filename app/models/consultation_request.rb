class ConsultationRequest < ApplicationRecord
  belongs_to :patient
  has_many :recommendations
end
