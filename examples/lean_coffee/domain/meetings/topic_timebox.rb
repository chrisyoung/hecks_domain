['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/topic_timebox/#{name}/*.rb"].each { |file| require_relative file }
end

module LeanCoffee
  module Meetings
    class TopicTimebox
      include HecksDomain::Factories::FactoryLoader

      attr_reader :duration, :extension

      def initialize(duration:, extension:)
        @duration = duration
        @extension = extension
      end

      private

      attr_writer :duration, :extension
    end
  end
end
