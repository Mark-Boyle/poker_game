require_relative('./round')
require_relative('./player')

class Play
  attr_accessor :player1, :opponet1, :opponet2, :opponet3

    def initialize
        @player1 = Player.new('Human')
        @opponent1 = Player.new('Computer')
        @opponent2 = Player.new('Computer')
        @opponent3 = Player.new('Computer')
        @round = Round.new
    end

    def run
        deal_hand
        deal_flop
        @round.display_common_cards
        deal_turn
        @round.display_common_cards
        deal_river
        @round.display_common_cards
    end

    def deal_hand
        puts "Player 1 cards:"
        @player1::cards << @round.select_card
        @player1::cards << @round.select_card
        @player1.display_hand
        puts 'Opponent 1 cards:'
        @opponent1::cards << @round.select_card
        @opponent1::cards << @round.select_card
        @opponent1.display_hand
        puts 'Opponent 2 cards:'
        @opponent2::cards << @round.select_card
        @opponent2::cards << @round.select_card
        @opponent2.display_hand
        puts 'Opponent 3 cards:'
        @opponent3::cards << @round.select_card
        @opponent3::cards << @round.select_card
        @opponent3.display_hand
    end

    def deal_flop
        @round.deal_common_card
        @round.deal_common_card
        @round.deal_common_card
        @round.update_flop(@player1::cards)
        @round.update_flop(@opponent1::cards)
        @round.update_flop(@opponent2::cards)
        @round.update_flop(@opponent3::cards)
    end

    def deal_turn
        @round.deal_common_card
        @round.update_turn(@player1::cards)
        @round.update_turn(@opponent1::cards)
        @round.update_turn(@opponent2::cards)
        @round.update_turn(@opponent3::cards)
    end

    def deal_river
        @round.deal_common_card
        @round.update_river(@player1::cards)
        @round.update_river(@opponent1::cards)
        @round.update_river(@opponent2::cards)
        @round.update_river(@opponent3::cards)
    end

    def show_hand
        @player1.display_hand
    end

    def display_pot
        puts "Pot: #{@round::pot}"
    end
end
