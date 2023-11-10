require "test_helper"

class RecommendationTest < ActiveSupport::TestCase
  def setup
    @schema = NewRecommendationContract.new
  end

  test 'validates a valid recommendation' do
    data = { 
      "recommendation": {
      "recommendation_text": "Valid text"
      }
    }
    result = @schema.call(data)
    assert result.success?
  end

  test 'requires recommendation to be a string with a set max size' do
    data = {
      "recommendation": {
        "recommenation_text": 'Very long text' * 1000
      }
    }
    result = @schema.call(data)
    assert result.failure?
  end
end
