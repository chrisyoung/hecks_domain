class HecksDomain
  class Parser
    class ListField < EntityField
      def initial_state
        return '[]' if read_only?

        name
      end

      def public_accessor; end
    end
  end
end