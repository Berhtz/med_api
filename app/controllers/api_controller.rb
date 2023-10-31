require 'net/http'

class ApiController < ApplicationController
    def make_api_request
        url = URI.parse("https://api.fda.gov/drug/event.json?api_key=0h0fp9LYZcwuF44r9EUWTxhy2sKWKHTd83AzHLUD&limit=1")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = (url.scheme == 'https')

        request = Net::HTTP::Get.new(url.request_uri)

        response = http.request(request)

        if response.is_a?(Net::HTTPSuccess)
            response_body = response.body
            puts "API request successful. Response body: #{response_body}"
        else
            error_message = "API request failes, status code: #{response.code}"
            puts error_message
        end
    end
end