require 'brew_sparkling/logger'

# Adapter for homebrew-fork
module Hbc
  module SystemCommand
  end

  module Utils
    # originally from Homebrew
    def self.ignore_interrupts(opt = nil)
      std_trap = trap('INT') do
        puts 'One sec, just cleaning up' unless opt == :quietly
      end
      yield
    ensure
      trap('INT', std_trap)
    end
  end

  def self.verbose
    true
  end

  class AbstractDownloadStrategy
    attr_reader :name, :url, :uri_object, :version

    def ohai(*args)
      logger.start args.join(' ')
    end

    def initialize(recipe, _ = nil)
      @name       = recipe.name
      @url        = recipe.url.to_s
      @uri_object = recipe.url
      @version    = recipe.version
    end

    # All download strategies are expected to implement these methods
    def fetch; end
    def cached_location; end
    def clear_cache; end

    def logger
      @logger ||= ::BrewSparkling::Logger.default
    end
  end
end

require 'vendor/homebrew-fork/exceptions'
require 'vendor/homebrew-fork/global'
require 'vendor/homebrew-fork/download_strategy'

class Hbc::CurlDownloadStrategy < Hbc::HbCurlDownloadStrategy
  def _fetch
    curl(*curl_args)
  end

  def fetch
    super
    tarball_path
  end

  private

  def curl_args
    [url, '-C', downloaded_size, '-o', temporary_path]
  end
end
