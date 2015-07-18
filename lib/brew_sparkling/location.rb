module BrewSparkling
  module Location
    class << self
      def sparkling_path
        @@sparkling_path ||= Pathname('/usr/local/BrewSparkling/')
      end

      def build_path
        sparkling_path.join('build')
      end
    end
  end
end
