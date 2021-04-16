# # require_relative('../poker')
# require_relative('./round')
# require_relative('./player')

# class Play
#   attr_accessor :player1, :opponet1, :opponet2, :opponet3

#     def initialize
#         @player1 = Player.new
#         @opponet1
#         @opponet2
#         @opponet3
#         @round
#     end

#     def run
#         deal_hand
#     end

#     def deal_hand
#         puts "Player 1 cards:"
#         @player1::cards << @round.deal_card
#         @player1::cards << @round.deal_card
#         puts @player1.display_hand
#         puts 'Opponent 1 cards:'
#         @opponet1::cards << @round.deal_card
#         @opponet1::cards << @round.deal_card
#         puts 'Opponent 2 cards:'
#         @opponet2::cards << @round.deal_card
#         @opponet2::cards << @round.deal_card
#         puts 'Opponent 3 cards:'
#         @opponet3::cards << @round.deal_card
#         @opponet3::cards << @round.deal_card
#     end

#     def show_hand
#         puts @player1.display_hand
#     end

#     def display_pot
#         puts @round::pot
#     end

# end

# # player1 = Player.new

# play = Play.new

# play.run

# play.display_pot
# play.show_hand 