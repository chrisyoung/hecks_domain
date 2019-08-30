['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/timebox/#{name}/*.rb"].each { |file| require_relative file }
end

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
