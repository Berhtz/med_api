class NewRecommendationContract < Dry::Validation::Contract
    params do
       required(:recommendation).schema do
        required(:recommendation_text).filled(:string, max_size?: 1000)
       end
    end
end