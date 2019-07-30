class HecksDomain
  class Parser
    class EntityField
      attr_reader :name
      def initialize(name)
        @name = name
      end

      def as(name)
        @as = name
      end

      def module_name
        @as
      end

      def optional?
        @optional
      end

      def attribute_name
        return name.to_s + ':' unless optional?
        name.to_s + ': nil'
      end
    end
  end
end