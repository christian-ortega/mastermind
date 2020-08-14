class Mastermind
    attr_accessor :code

    COLORS = ["R", "O", "Y", "G", "B", "P"]
    def initialize
        @code = generate_code
    end

    def generate_code
        code = Array.new
        4.times { code.push(COLORS.sample) }
        return code
    end
end

mastermind = Mastermind.new
p mastermind.code