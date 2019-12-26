module DomainSupport
  module Commands
    module CommandLoader
      def self.included(base)
        return unless base.constants.include?(:Commands)

        base::Commands.constants.each do |constant|
          base.class_eval "
            def #{constant.to_s.underscore}!(*args, &block)
              command_class = Commands::#{constant}
              command = command_class.new(self, *args)
              CommandRunner.run(command, &block)
            end
          "
        end
      end
    end
  end
end
