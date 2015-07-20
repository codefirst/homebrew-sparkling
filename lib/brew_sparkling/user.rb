require 'brew_sparkling/gateway/xcode'
require 'digest/sha1'

module BrewSparkling
  class User
    def account
      @account ||= find_or_first(accounts) { |account|
        account.username == ENV['BREW_SPARKLING_USERNAME']
      }
    end

    def certificate
      @certificate ||= find_or_first(certificates) { |certificate|
        certificate.commonName == ENV['BREW_SPARKLING_CERTIFICATE']
      }
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

    def gateway
      @gateway ||= Gateway::Xcode.default
    end

    def find_or_first(xs, &f)
      first = proc { xs.first }
      xs.find(first, &f)
    end
  end
end
