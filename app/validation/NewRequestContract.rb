class NewRequestContract < Dry::Validation::Contract
    params do
       required(:consultation_request).schema do
        required(:patient_id).filled(:integer)
        required(:request_text).filled(:string, max_size?: 1000)
       end
    end
end