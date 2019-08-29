['services', 'commands', 'invariants', 'factories', 'repository', 'queries', 'events', 'subscribers'].each do |name|
  Dir[File.dirname(__FILE__) + "/topic/#{name}/*.rb"].each { |file| require_relative file }
end

require_relative 'topic/repository'
['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/topic/#{name}/*.rb"].each { |file| require_relative file }
end


module LeanCoffee
  module Topics
    class Topic
      include HecksDomain::Factories::FactoryLoader
      
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader
      include HecksDomain::Queries::QueryLoader

      attr_reader :value, :votes, :phase, :timebox, :id

      def initialize(value:, votes:, phase: nil, timebox:)
        @value = value
        @votes = votes
        @phase = phase
        @timebox = timebox
      end

      private

      attr_writer :value, :votes, :phase, :timebox, :id
    end
  end
end
