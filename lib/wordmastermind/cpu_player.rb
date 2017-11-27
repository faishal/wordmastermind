require_relative "player"
require_relative "engine"
class CpuPlayer < Player
  def initialize()
    @engine = Engine.new
  end

  def guess(bulls, cows)
    @engine.check(bulls, cows)
    say @engine.current_guess.upcase
  end
end