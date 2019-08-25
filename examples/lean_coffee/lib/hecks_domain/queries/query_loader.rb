class HecksDomain
  module Queries
    module QueryLoader
      def self.included(base)
        base::Queries.constants.each do |constant|
          raise "Query name `#{constant}` not valid.  Query classes must start with 'Find'" unless constant.to_s.underscore =~ /^find_.*/
          
          base.class_eval "
            def #{constant.to_s.underscore}(*args, &block)
              Queries::#{constant}.query(self, *args)
            end
          "
        end
      end
    end
  end
end
