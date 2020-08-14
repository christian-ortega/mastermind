class Mastermind
	public

	attr_accessor :code
	COLORS = ["R", "O", "Y", "G", "B", "P"]
	
	def initialize
    @code = generate_code
		@guess = Array.new(4)
		@guesses = Array.new
		@feedbacks = Array.new
    print_heading
  end

	def game
		12.times do |i|
			puts "Guess four colors (Attempt #{i + 1}/12):"
			puts "Valid colors are [#{COLORS.join(", ")}]"
			4.times { |number| make_guess(number) }
			break if @guess == @code
			puts ""
			puts "You guessed wrong!"
			puts ""
			break if i == 11
			@guesses.push(@guess.clone)
			generate_feedback
			print_feedback
		end
		
		if @guess == @code
			puts "\nYou guessed right!"
			puts "The answer: [#{@code.join(", ")}]"

			puts "GAME OVER. You Win!"
		else
			puts "The answer: [#{@code.join(", ")}]"
			puts "GAME OVER. You Lose..."
		end
  end

	private

  def generate_code
    code = Array.new
    4.times { code.push(COLORS.sample) }
    return code
  end

	def make_guess(number)
		color = nil
		loop do
			print "Color ##{number + 1}: "
			color = gets.chomp.upcase
			break if COLORS.include?(color)
			puts ""
			puts "Invalid Entry! Try again."
			puts ""
		end
		@guess[number] = color
	end
	
	def generate_feedback
		feedback = Array.new
		temp_code = @code.clone
		temp_guess = @guess.clone

		4.times do |i|
			if temp_code[i] == temp_guess[i]
				feedback.push("C")
				temp_code[i] = nil
				temp_guess[i] = nil
			end
		end

		4.times do |j|
			unless temp_guess[j].nil?
				index = temp_code.index(temp_guess[j])
				if index
					feedback.push("W")
					temp_code[index] = nil
					temp_guess[j] = nil
				end
			end
		end

		@feedbacks.push(feedback)
	end

	def print_feedback
		puts "            |    Guess     |   Feedback"
		puts "____________|______________|_______________"
		@guesses.each_with_index do |element, index|
			if index < 9
				puts "Attempt ##{index + 1}  | [#{element.join(", ")}] | [#{@feedbacks[index].join(", ")}]"
			else
				puts "Attempt ##{index + 1} | [#{element.join(", ")}] | [#{@feedbacks[index].join(", ")}]"
			end
		end
		puts ""
	end

  def print_heading
    puts "=== MASTERMIND ==="
    puts ""
    puts "How The Game Works:"
		puts "1. The codemaker chooses a pattern of four colors in a specific order."
		puts "2. The codebreaker has twelve chances to guess the codemaker's pattern, in both color and order."
		puts "3. Every time the codebreaker gets a guess wrong, the codemaker provides feedback on how good the guess was."
		puts "	a. The codebreaker provides a 'C' marker for each instance where the guess contains a correct color in the correct place."
		puts "	b. The codebreaker provides a 'W' marker for each instance where the guess contains a correct color in the wrong place."
		puts "4. If the codebreaker guesses right within twelve chances, the codebreaker wins. If not, the codemaker wins."
    puts ""
		puts "Computer has generated a code."
		puts ""
  end
end

mastermind = Mastermind.new
# p mastermind.code
mastermind.game