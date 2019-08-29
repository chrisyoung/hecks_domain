['services', 'commands', 'invariants', 'factories', 'repository', 'queries', 'events', 'subscribers'].each do |name|
  Dir[File.dirname(__FILE__) + "/discussion/#{name}/*.rb"].each { |file| require_relative file }
end

require_relative 'discussion/repository'
['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/discussion/#{name}/*.rb"].each { |file| require_relative file }
end


module LeanCoffee
  module Discussions
    class Discussion
      include HecksDomain::Factories::FactoryLoader
      
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader
      include HecksDomain::Queries::QueryLoader

      attr_reader :phase, :discussing, :id

      def initialize(phase: nil, discussing: nil, discussed: [], topics: [])
        @phase = phase
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

      attr_writer :phase, :discussing, :discussed, :topics, :id
    end
  end
end
