class Patient < ApplicationRecord
    has_many :consultation_requests
    has_many :recommendations, through: :consultation_requests
end
