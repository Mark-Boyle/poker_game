class Round
    attr_accessor :round_number, :pot, :bet

    def initialize
        @round_number = 1
        @pot = 0
        @bet = 0
    end
end