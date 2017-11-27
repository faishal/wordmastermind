require_relative "player"
require_relative "engine"
class CpuPlayer < Player
  def initialize()
    @engine = Engine.new
  end

  def get_try_count()
    @engine.try_count
  end

  def get_current_guess()
    @engine.current_guess.upcase
  end

  def guess(bulls, cows)
    @engine.check(bulls, cows)
    say get_current_guess
  end
end