require_relative('./lib/round')
require_relative('./lib/player')
require_relative('./lib/play')

# player1 = Player.new
# opponet1 = Player.new
# opponet2 = Player.new
# opponet3 = Player.new
# round = Round.new

# def run
#     give_starting_chips
#     deal_hand
#     show_hand
# end


# def deal_hand
#     player1::cards << deal_two_cards
#     opponet1::cards << deal_two_cards
#     opponet2::cards << deal_two_cards
#     opponet3::cards << deal_two_cards
# end

# def show_hand
#     puts player1::cards
# end

# run
round = Round.new
player1 = Player.new
opponent1 = Player.new
opponent2 = Player.new
opponent3 = Player.new

player1::cards.push(round.select_card)
player1::cards.push(round.select_card)
opponent1::cards.push(round.select_card)
opponent1::cards.push(round.select_card)
opponent2::cards.push(round.select_card)
opponent2::cards.push(round.select_card)
opponent3::cards.push(round.select_card)
opponent3::cards.push(round.select_card)

player1.display_hand

round.display_common_cards