# Word Master Mind

Command  line program in ruby that accurately and efficiently guesses the word in 4 letter word Cows and Bulls game.

* One player, the Chooser, thinks of a four-letter word and the other player, the Guesser, tries to guess it.
* At each turn the Guesser tries a four-letter word, and the Chooser says how close it is to the answer by giving:
* The number of Bulls - letters correct in the right position.
* The number of Cows - letters correct but in the wrong position.
* The Guesser tries to guess the answer in the fewest number of turns.
* The word to be guessed should not have repeating letters. Example, BOOK, TILT, KICK, BASS etc. are not allowed.

## Usage

* Checkout repository 
* Install Bundler

		sudo gem install bundler

* Install dependencies
		
		./bin/setup

* Start the game
	
		./bin/console

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/faishal/wordmastermind.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

