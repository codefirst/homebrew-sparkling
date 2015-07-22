require 'brew_sparkling/gateway/xcode'
require 'digest/sha1'

module BrewSparkling
  class User
    def account
      @account ||= find_or_first(accounts) { |account|
        account.username == env(:username)
      }
    end

    def certificate
      @certificate ||= find_or_first(certificates) { |certificate|
        certificate.commonName == env(:certificate)
      }
    end

    def device
      @device ||= find_or_first(devices) { |device|
        device.name == env(:device)
      }
    end

    def gateway
      @gateway ||= Gateway::Xcode.default
    end

    def postfix
      Digest::SHA1.hexdigest account.username
    end

    private

    def accounts
      @accounts ||= gateway.accounts
    end

    def certificates
      @certificates ||= gateway.certificates
    end

    def devices
      @devices ||= gateway.devices
    end

    def env(name)
      ENV["BREW_SPARKLING_#{name.to_s.upcase}"]
    end

    def find_or_first(xs, &f)
      first = proc { xs.first }
      xs.find(first, &f)
    end
  end
end
