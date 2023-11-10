require 'dry-validation'
require 'net/http'

class RecommendationController < ApplicationController
    skip_before_action:verify_authenticity_token
    def create

        json = JSON.parse(request.body.read)
        contract = NewRecommendationContract.new
        result = contract.call(json)

        if result.success?
            consultation_request = ConsultationRequest.find(params[:request_id])
            @recommendation = consultation_request.recommendations.build(recommendation_params)
            if @recommendation.save
                render json: @recommendation, status: :created
            else
                render json: @recommendation.errors, status: :unprocessable_entity
            end
        else
            render json: result.errors.to_h, status: :unprocessable_entity
        end
    end

    def get_recommendations
        patient = Patient.find(params[:patient_id])

        @recommendations = patient.recommendations

        render json: @recommendations
    end

    private
    def recommendation_params
        params.require(:recommendation).permit(:recommendation_text)
    end
end
    