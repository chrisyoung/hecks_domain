module LeanCoffee
  module Domain
    module Meetings
      class Discussion
        
        include Support::DomainObject

        attr_reader :id, :discussing, :id

        def initialize(id: nil, discussing: nil, discussed: [], topics: [])
          @id = id
          @discussing = discussing
          @discussed = discussed
          @topics = topics
        end

        def discussed
          @discussed.clone.freeze
        end

        def topics
          @topics.clone.freeze
        end

        private

        attr_writer :id, :discussing, :discussed, :topics
      end
    end
  end
end
