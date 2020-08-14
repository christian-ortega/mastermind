class Mastermind
	attr_accessor :code

  COLORS = ["R", "O", "Y", "G", "B", "P"]
  def initialize
    @code = generate_code
		@guess = Array.new(4)
    puts heading
  end

	def game
		12.times do |i|
			puts "Guess four colors (#{i + 1}/12):"
			puts "Valid colors are #{COLORS.join(", ")}"
			4.times { |number| make_guess(number) }
			break if @guess == @code
			puts ""
			puts "You guessed wrong!"
			break if i == 11
			give_feedback
		end
    @guess == @code ? (puts "\nYou guessed right!\nGAME OVER. You Win!") : (puts "GAME OVER. You Lose...")
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
	
	def give_feedback
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

		puts "You guessed: #{@guess}"
		puts "Computer feedback: #{feedback}"
		puts ""
	end

  def generate_code
    code = Array.new
    4.times { code.push(COLORS.sample) }
    return code
  end

  #finish rules
  def heading
    puts "=== MASTERMIND ==="
    puts ""
    puts "Rules:"
    puts "1. "
    puts ""
    puts "Computer has generated a code."
    puts ""
  end
end

mastermind = Mastermind.new
p mastermind.code
mastermind.game