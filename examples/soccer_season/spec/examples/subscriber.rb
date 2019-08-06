RSpec.shared_examples "subscriber" do
  class Subscriber
    attr_reader :type
    def initialize(type)
      @type = type
    end

    def notify(event)
      # Do nothing
    end
  end

  class LoggingSubscriber
    attr_accessor :type
    def initialize(type)
      @type = type
    end

    def notify(event)
      Logger.log(event)
    end
  end
end
