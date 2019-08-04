class HecksDomain
  class Parser
    class BooleanField < ValueField
      def initial_state
        return 'nil' if read_only?
        name
      end
    end
    class ListField < EntityField
      def initial_state
        return '[]' if read_only?
        name
      end
    end
    class Entity < DomainObject;end
    class Head < Entity;end
    class ValueObject < DomainObject;end
    class StringField < ValueField;end
    class IntegerField < ValueField;end
    class CurrencyField < ValueField;end 
  end
end