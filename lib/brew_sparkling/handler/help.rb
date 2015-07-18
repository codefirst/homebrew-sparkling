module BrewSparkling
  module Handler
    class Help < Base
      command def help
        Handler.commands.each do |command|
          puts "brew sparkling #{command}"
        end
      end
    end
  end
end
