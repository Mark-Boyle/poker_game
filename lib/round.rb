class Round
    attr_accessor :round_number, :pot, :bet

    def initialize
        @round_number = 1
        @pot = 0
        @bet = 0
        @common_cards = []
        @used_hearts = []
        @used_diamonds = []
        @used_clubs = []
        @used_spades = []
    end

    def select_card
        suit = ['heart', 'diamond', 'club', 'spade']
        card = rand(2..14)
        selected_card = {suit: suit.sample, card: card}
        puts selected_card
    end
end