class HecksDomain
  class BooleanField < ValueField
    def initial_state
      return 'nil' if read_only?
      name
    end
  end
  class Entity < DomainObject;end
  class Root < Entity;end
  class ValueObject < DomainObject;end
  class StringField < ValueField;end
  class IntegerField < ValueField;end
  class CurrencyField < ValueField;end 
end
