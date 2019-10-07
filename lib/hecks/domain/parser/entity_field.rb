class HecksDomain
  class Parser
    class EntityField
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def as(name)
        @as = name
        self
      end

      def module_name
        @as
      end

      def public_accessor
        ":#{name}"
      end

      def private_accessor
        ":#{name}"
      end

      def initial_state
        name
      end

      def read_only=(value)
        @read_only = value
      end

      def optional=(value)
        @optional = value
      end

      def read_only?
        @read_only
      end

      def optional?
        @optional
      end

      def attribute_name
        return name.to_s + ':' unless optional?
        return name.to_s + ': []' if is_a?(ListField)

        name.to_s + ': nil'
      end
    end
  end
end