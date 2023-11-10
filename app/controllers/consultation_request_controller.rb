require 'dry-validation'
require 'net/http'

class ConsultationRequestController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        json = JSON.parse(request.body.read)
        contract = NewRequestContract.new
        result = contract.call(json)

        if result.success?
            @consultation_request = ConsultationRequest.new(consult_params)
            if @consultation_request.save
                render json: @consultation_request, status: :created
            else
                render json: @consultation_request.errors.to_h, status: :unprocessable_entity
            end
        else
            render json: result.errors.to_h, status: :unprocessable_entity
        end
    end

    private
    def consult_params
        params.require(:consultation_request).permit(:patient_id, :request_text)
    end
end