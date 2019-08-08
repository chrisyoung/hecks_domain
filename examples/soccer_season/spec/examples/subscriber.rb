RSpec.shared_examples "subscriber" do
  class Subscriber
    attr_reader :domain_event
    def initialize(domain_event)
      @domain_event = domain_event
    end

    def notify(event)
      # Do nothing
    end
  end

  class LoggingSubscriber
    attr_accessor :domain_event
    def initialize(domain_event)
      @domain_event = domain_event
    end

    def notify(event)
      Logger.log(event)
    end
  end

  class ScoreOnAddGoal
    def domain_event
      SoccerSeason::Matches::Match::Commands::AddGoal
    end

    def notify(event)
      event.head.score!
    end
  end

  class Logger
    def self.log(event)
      [
        "\tEVENT FIRED!",
        "\tevent name: " + event.name,
        "\thead_id:" + event.head.id.to_s,
        "\targs: " + event.args.to_s,
        "\thead: " + event.command.head.inspect,
      ].each { |value| puts value }
    end
  end
end
