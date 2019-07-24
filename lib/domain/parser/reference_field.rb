class Domain
    class Parser
      class ReferenceField < EntityField
        attr_reader :name
        def module_name
          @as.keys.first.to_s + '::' + @as.values.first.to_s
        end
      end
    end
  end