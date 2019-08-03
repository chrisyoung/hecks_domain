module SoccerSeason
  module Helpers
    module CommandLoader
      def self.included(base)
        base::Commands.constants.each do |constant|
          base.class_eval "
            def #{constant.to_s.underscore}(*args)
              Commands::#{constant}.new(self, *args).call  
            end
          "
        end
      end
    end
  end
end
