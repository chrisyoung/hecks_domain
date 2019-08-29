['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/exension/#{name}/*.rb"].each { |file| require_relative file }
end


module LeanCoffee
  module Topics
    class Exension
      include HecksDomain::Factories::FactoryLoader
      

      attr_reader :duration, :yes_votes, :no_votes

      def initialize(duration:, yes_votes:, no_votes:)
        @duration = duration
        @yes_votes = yes_votes
        @no_votes = no_votes
      end

      private

      attr_writer :duration, :yes_votes, :no_votes
    end
  end
end
