require "highline/import"
  class Player
    def initialize
      @cli = HighLine.new
    end

    def ask(message)
      @cli.ask(message)
    end

    def say(message)
      @cli.say message
    end

    def get_bulls
      @cli.ask("Number of Bulls?").to_i
    end

    def get_cows
      @cli.ask("Number of Cows?").to_i
    end

    def ready?
      confirm = @chooser.ask("Did you guessed the 4 letter word? [Y/N]") {|yn| yn.limit = 1, yn.validate = /[yn]/i}
      confirm.downcase == 'y'
    end

    def guess(bulls, cows)

    end
  end