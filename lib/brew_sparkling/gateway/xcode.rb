require 'dnssd'
require 'timeout'
require 'json'
require 'ostruct'
require 'net/http'

module BrewSparkling
  module Gateway
    class Xcode
      class ConnectionError < StandardError
      end

      class << self
        def availables(&f)
          timeout 1 do
            DNSSD.resolve! 'SparklingHelper','_http._tcp.', 'local' do |reply|
              f.call reply.target, reply.port
            end
          end
        rescue Timeout::Error
        end

        def default
          availables do |host, port|
            # initialize Xcode class by first matched service
            return Xcode.new(host, port)
          end
        end
      end

      attr_reader :host, :port

      def initialize(host, port)
        @host = host
        @port = port
      end

      def devices
        get('/devices')
          .map { |device| OpenStruct.new(device) }
          .select { |device| device.platform == 'iphoneos' }
      end

      def accounts
        get('/accounts').map { |device| OpenStruct.new(device) }
      end

      def certificates
        get('/certificates').map { |device| OpenStruct.new(device) }
      end

      def request_provisioning(account, certificate, device, bundle_id)
        get('/request_provisioning', username: account.username,
                                     certificateName: certificate.commonName,
                                     deviceName: device.name,
                                     bundleIdentifier: bundle_id)
      end

      def url
        "http://#{host}:#{port}"
      end

      private

      def get(path, params = {})
        query = URI.encode_www_form(params)
        response = connection.get("#{path}?#{query}")
        if response.code == '200'
          JSON.parse(response.body)
        else
          fail ConnectionError, response.body
        end
      end

      def connection
        @connection ||= Net::HTTP.new(host, port)
      end
    end
  end
end
