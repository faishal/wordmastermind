require_relative "player"
require_relative "engine"
class CpuPlayer < Player
  def initialize()
    @engine = Engine.new
  end

  def guess(bulls, cows)
    # @todo write the engine
  end
end