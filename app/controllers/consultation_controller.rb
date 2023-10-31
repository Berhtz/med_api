class ConsultationController < ApplicationController
    skip_before_action:verify_authenticity_token
    def create
        @consultation_request = ConsultationRequest.new(consult_params)

        if @consultation_request.save
            render json: @consultation_request, status: :created
        else 
            render json: @consultation_request.errors, status: :unprocessable_entity
        end
    end

    private
    def consult_params
        params.require(:consultation_request).permit(:patient_id, :request_text)
    end


end