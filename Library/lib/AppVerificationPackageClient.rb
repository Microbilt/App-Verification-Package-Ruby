require 'net/http'
require 'json'
require_relative 'clients/AddressNameVerificationClient'
require_relative 'clients/AddressStandardizationClient'
require_relative 'clients/DeathMasterFileValidationClient'
require_relative 'clients/DLVerifyClient'
require_relative 'clients/EmailValidationClient'
require_relative 'clients/IPAddressInfoClient'
require_relative 'clients/OFACWatchlistSearchClient'
require_relative 'clients/PhoneAddressVerificationClient'
require_relative 'clients/PhoneNameVerificationClient'
require_relative 'clients/SSNAddressVerificationClient'
require_relative 'clients/SSNNameVerificationClient'
require_relative 'clients/SSNPhoneVerificationClient'
require_relative 'clients/SSNValidationClient'

module AppVerificationPackage
  class AppVerificationPackageClient
    attr_reader :authorization, :address_name_verification_client, :address_standardization_client, :death_master_file_validation_client,
                :dl_verify_client, :email_validation_client, :ip_address_info_client, :ofac_watchlist_search_client,
                :phone_address_verification_client, :phone_name_verification_client, :ssn_address_verification_client,
                :ssn_name_verification_client, :ssn_phone_verification_client, :ssn_validation_client, :base_uri

    def initialize(client_id, client_secret, environment_type = EnvironmentType::Production)
      @base_uri = URI(EnvironmentType.descriptions[environment_type])
      @authorization = mba_authorizations(client_id, client_secret)
      @address_name_verification_client = AppVerificationPackage::APIClients::AddressNameVerificationClient.new(@authorization, @base_uri)
      @address_standardization_client = AppVerificationPackage::APIClients::AddressStandardizationClient.new(@authorization, @base_uri)
      @death_master_file_validation_client = AppVerificationPackage::APIClients::DeathMasterFileValidationClient.new(@authorization, @base_uri)
      @dl_verify_client = AppVerificationPackage::APIClients::DLVerifyClient.new(@authorization, @base_uri)
      @email_validation_client = AppVerificationPackage::APIClients::EmailValidationClient.new(@authorization, @base_uri)
      @ip_address_info_client = AppVerificationPackage::APIClients::IPAddressInfoClient.new(@authorization, @base_uri)
      @ofac_watchlist_search_client = AppVerificationPackage::APIClients::OFACWatchlistSearchClient.new(@authorization, @base_uri)
      @phone_address_verification_client = AppVerificationPackage::APIClients::PhoneAddressVerificationClient.new(@authorization, @base_uri)
      @phone_name_verification_client = AppVerificationPackage::APIClients::PhoneNameVerificationClient.new(@authorization, @base_uri)
      @ssn_address_verification_client = AppVerificationPackage::APIClients::SSNAddressVerificationClient.new(@authorization, @base_uri)
      @ssn_name_verification_client = AppVerificationPackage::APIClients::SSNNameVerificationClient.new(@authorization, @base_uri)
      @ssn_phone_verification_client = AppVerificationPackage::APIClients::SSNPhoneVerificationClient.new(@authorization, @base_uri)
      @ssn_validation_client = AppVerificationPackage::APIClients::SSNValidationClient.new(@authorization, @base_uri)
    end

    private

    def mba_authorizations(client_id, client_secret)
      uri = URI.join(@base_uri.to_s, 'OAuth/GetAccessToken')
      request = Net::HTTP::Post.new(uri)
      request['Accept'] = 'application/json'
      request.content_type = 'application/json'

      authorization_payload = {
        client_id: client_id,
        client_secret: client_secret,
        grant_type: 'client_credentials'
      }

      request.body = authorization_payload.to_json

      response = send_request(uri, request)

      if response.code.to_i == 200
        json_response = JSON.parse(response.body)
        if json_response.key?('access_token')
          json_response['access_token']
        else
          raise "Authorization failed: #{response.body}"
        end
      else
        raise "Authorization failed: #{response.body}"
      end
    end

    def send_request(uri, request)
      Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request(request)
      end
    rescue StandardError => e
      raise "HTTP Request failed: #{e.message}"
    end
  end
end