require 'net/http'
require 'uri'
require 'json'
require_relative 'MBBaseClient'

module AppVerificationPackage
  module APIClients
    class DeathMasterFileValidationClient
      API_NAME = "DeathMasterFileValidation".freeze

      def initialize(authorization, base_url)
        @client = MBBaseClient.new(authorization, base_url)
      end

      def get_report(json_request_model)
        url = URI.join(@client.base_url.to_s, "#{API_NAME}")
        response = @client.post(url, JSON.parse(json_request_model))
        JSON.parse(response.to_json)
      end
    end
  end
end