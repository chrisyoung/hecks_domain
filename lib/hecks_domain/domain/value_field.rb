class HecksDomain
  class Parser
    class ValueField
      attr_reader :name
      attr_writer :optional
      attr_writer :read_only

      def initialize(name)
        @name = name
      end

      def optional?
        @optional
      end

      def initial_state
        name
      end

      def attribute_name
        return name.to_s + ':' unless optional?
        name.to_s + ': nil'
      end

      def module_name
        @as
      end

      def read_only?
        @read_only
      end

      def as(name)
        @as = name
      end
    end
  end
end