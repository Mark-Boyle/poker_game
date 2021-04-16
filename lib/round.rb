require_relative './player'
class Round
    attr_accessor :round_number, :pot, :bet

    def initialize
        @round_number = 1
        @pot = 50
        @bet = 0
        @common_cards = []
        @used_cards = []
    end

    def select_card
        suit = ['heart', 'diamond', 'club', 'spade']
        selected_card = {suit: suit.sample, card: rand(2..14)}
        if @used_cards.include?(selected_card)
            select_card
        else
            @used_cards << selected_card
        end
        selected_card
    end

    def deal_hand
        puts "Player 1 cards:"
        @player_cards << select_card
        @player_cards << select_card
        puts @player_cards
    end

    def display_common_cards
        puts @common_cards
    end

    def deal_card
        select_card
    end
end
