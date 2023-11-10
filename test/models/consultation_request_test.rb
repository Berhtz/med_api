require "test_helper"

class ConsultationRequestTest < ActiveSupport::TestCase
  def setup
    @schema = NewRequestContract.new
  end

  test 'validates a valid consultation request' do
    data = { 
      "consultation_request": {
      "patient_id": 1,
      "request_text": "Valid text"
      }
    }
    result = @schema.call(data)
    assert result.success?
  end

  test 'requires patient_id to be filled' do
    data = { 
      "consultation_request": {
        "request_text": "example text"
      }
    }
    result = @schema.call(data)

    assert result.failure?
  end

  test 'requires request_text to be a string with a set max size' do
    data = {
      "consultation_request": {
        "patient_id": 1,
        "request_text": 'Very long text' * 1000
      }
    }

    result = @schema.call(data)

    assert result.failure?
  end
end
