['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/discussion/#{name}/*.rb"].each { |file| require_relative file }
end

module LeanCoffee
  module Meetings
    class Discussion
      include HecksDomain::Factories::FactoryLoader

      attr_reader :discussing, :id

      def initialize(discussing: nil, discussed: [], topics: [])
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

      attr_writer :discussing, :discussed, :topics, :id
    end
  end
end
