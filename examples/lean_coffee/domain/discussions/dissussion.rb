require_relative 'dissussion/factories'
require_relative 'dissussion/invariants'
require_relative 'dissussion/repository'
require_relative 'dissussion/commands'

module LeanCoffee
  module Discussions
    class Dissussion
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader

      attr_reader :topic, :timebox, :id

      def initialize(topic:, timebox:)
        @topic = topic
        @timebox = timebox
      end

      private

      attr_writer :topic, :timebox, :id
    end
  end
end
