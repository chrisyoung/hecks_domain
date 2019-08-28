Dir[File.dirname(__FILE__) + "/timebox/factories/*.rb"].each { |file| require_relative file }

module LeanCoffee
  module Topics
    class Timebox
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
