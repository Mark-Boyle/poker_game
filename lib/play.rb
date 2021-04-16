# require_relative('../poker')
require_relative('./round')
require_relative('./player')

class Play
attr_accessor :player1, :opponet1, :opponet2, :opponet3

    def initialize
        @player1 = Player.new
        @opponet1 = Player.new
        @opponet2 = Player.new
        @opponet3 = Player.new
        @round = Round.new
    end

    def run
        deal_hand
        # show_hand
        puts @round::pot
    end

    def deal_hand
        puts "Player 1 cards:"
        @player1::cards << @round.deal_two_cards
        puts 'Opponent 1 cards:'
        @opponet1::cards << @round.deal_two_cards
        puts 'Opponent 2 cards:'
        @opponet2::cards << @round.deal_two_cards
        puts 'Opponent 3 cards:'
        @opponet3::cards << @round.deal_two_cards
    end

    def show_hand
        puts @player1::cards
    end

end

play = Play.new

play.run