['services', 'commands', 'invariants', 'factories', 'repository', 'queries', 'events', 'subscribers'].each do |name|
  Dir[File.dirname(__FILE__) + "/discussion/#{name}/*.rb"].each { |file| require_relative file }
end

require_relative 'discussion/repository'

module LeanCoffee
  module Discussions
    class Discussion
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader
      include HecksDomain::Queries::QueryLoader

      attr_reader :topic, :votes, :phase, :timebox, :id

      def initialize(topic:, votes:, phase: nil, timebox:)
        @topic = topic
        @votes = votes
        @phase = phase
        @timebox = timebox
      end

      private

      attr_writer :topic, :votes, :phase, :timebox, :id
    end
  end
end
