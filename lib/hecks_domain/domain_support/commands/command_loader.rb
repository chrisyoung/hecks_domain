class HecksDomain
  module Commands
    module CommandLoader
      def self.included(base)
        base::Commands.constants.each do |constant|
          base.class_eval "
            def #{constant.to_s.underscore}!(*args, &block)
              HecksDomain::Commands::CommandRunner.run(
                Commands::#{constant}.new(self, *args), &block
              )
            end
          "
        end
      end
    end
  end
end
