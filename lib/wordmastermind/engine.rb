class Engine
  SIZE = 4
  attr_reader :guesses, :candidates, :try_count

  def initialize
    @guesses = []
    @ignored = []
    @ranking = []
    @allowed = [*'a'..'z']
    @try_count = 0
    @candidates = File.read(File.dirname(__FILE__) +"/../../db/list.txt").split("\n").uniq
  end

  def check(bulls, cows)
    filter_candidates(bulls, cows)
    puts "Now : " + @candidates.length.to_s
    candidates.any? && guess
  end

  def current_guess
    guesses.last || guess
  end

  private

  def guess
    @try_count += 1
    @guesses << candidates.sample
  end

  def filter_candidates(bulls, cows)
    last_guess = @guesses.last || ""

    last_guess_arr = last_guess.split(//)
    correct = ""
    #Correct word position
    correct_position = SIZE - bulls
    #InCorrect word position
    incorrect_position = correct_position - 1
    #InCorrect letter
    incorrect_letter = last_guess_arr[incorrect_position]

    if bulls > 0
      #Extract correct substring
      correct = last_guess_arr.last(bulls).join("").to_s
    end

    if !cows.nil?
      #Lets check cows
      if cows == 0
        #if cows is 0 then add all other letters in ignore
        @ignored = last_guess_arr.first(SIZE - bulls)
      elsif (cows + bulls == SIZE)
        #if cows + bulls = limit then discard all other letter - add them in ingore list
        #@TODO : It will not work for the case when actual word is ABCD and guess word is ABXD ( bulls - 1 Cows - 0 )
        @ignored = @allowed - last_guess_arr.last(bulls) -last_guess_arr.first(cows)
      elsif (cows == 0 && bulls == 0)
        # @TODO: implement letter ranking to predict next correct letter
        # @ignored = [last_guess_arr.last]
      end
    end
    if @candidates.length == 0
      puts "Something went wrong : check your input !! "
      exit
    end
    @candidates = candidates.select do |guess|
      if !correct.empty?
        if guess.index(correct) != correct_position
          next(false) #if not word doesn't have bulls in correct position
        end
      end
      guess_arr = guess.split(//)
      #bulls -1 will always have incorrect letter - we can remove it
      if guess_arr[incorrect_position] == incorrect_letter
        puts guess
        next(false)
      end
      #ignore all incorrect letter containing words
      if ((guess_arr & @ignored).length > 0)
        next(false)
      end
      next(true)
    end
  end
end