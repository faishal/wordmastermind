require_relative "human_player"
require_relative "cpu_player"
class Game

  attr_reader :limit

  def initialize
    @limit = 4
    @retry_max = 5
    @retry_count = 0
    @bulls = 0
    @cows = nil

    @chooser = HumanPlayer.new
    @guessor = CpuPlayer.new
    start
  end

  def start
    @chooser.say welcome

    until (@chooser.ready?)
    end

    loop do
      @guessor.guess(@bulls, @cows)

      @new_bulls = @chooser.get_bulls
      @new_cows = @chooser.get_cows
      if is_valid_bulls_cows(@new_bulls, @new_cows)
        @chooser.say(invalid_bulls_cows)
        break
      else
        @bulls = @new_bulls
        @cows = @new_cows
      end
      break if finished?
    end
    @chooser.say "You word is " + @guessor.get_current_guess
    @chooser.say "Total tries : " + @guessor.get_try_count.to_s
  end

  def is_valid_bulls_cows(bulls, cows)
    bulls + cows > @limit
  end

  def finished?
    @bulls == @limit
  end

  private
  def welcome
    "
|    | _ ._ _|  |\\/| _  __|_ _._  |\\/|o._  _|
 \\\/\\\/ (_)| (_|  |  |(_|_\\ | }_|   |  ||| |(_|

 ====================================================================
 * Choose a 4 letters word and computer will try to guess it.
 * Make sure it doesn't have duplicate character
 * When computer give you a guess, you will give Bulls & Cows number
 * The number of Bulls - letters correct in the right position.
 * The number of Cows - letters correct but in the wrong position.
 ===================================================================="
  end

  def invalid_bulls_cows
    "Invalid bulls & cows value : It seems that you've made a mistake somewhere."
  end
end