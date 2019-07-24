class Domain
  class Parser
    class ValueField
      attr_reader :name
      attr_writer :optional
      def initialize(name, options={})
        @optional = options[:optional]
        @name = name
      end

      def optional?
        @optional
      end

      def attribute_name
        return name.to_s + ':' unless optional?
        name.to_s + ': nil'
      end

      def module_name
        @as
      end

      def as(name)
        @as = name
      end
    end
  end
end