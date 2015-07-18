require 'brew_sparkling/homebrew/adapter'

module BrewSparkling
  module Homebrew
    class Download
      attr_reader :strategy

      def initialize(recipe)
        @strategy = Hbc::CurlDownloadStrategy.new(recipe)
      end

      def call
        p tarball
      end

      def tarball
        @tarball ||= strategy.fetch
      end
    end
  end
end
