require_relative('./lib/round')
require_relative('./lib/player')
require_relative('./lib/play')

round = Round.new
player1 = Player.new('Human')
opponent1 = Player.new('Computer')
opponent2 = Player.new('Computer')
opponent3 = Player.new('Computer')

#Deal cards to each player
player1::cards.push(round.select_card)
player1::cards.push(round.select_card)
opponent1::cards.push(round.select_card)
opponent1::cards.push(round.select_card)
opponent2::cards.push(round.select_card)
opponent2::cards.push(round.select_card)
opponent3::cards.push(round.select_card)
opponent3::cards.push(round.select_card)

# Deal flop
round.deal_common_card
round.deal_common_card
round.deal_common_card
round.update_flop(player1::cards)
round.update_flop(opponent1::cards)
round.update_flop(opponent2::cards)
round.update_flop(opponent3::cards)

player1.display_hand

# Deal turn
round.deal_common_card
round.update_turn(player1::cards)
round.update_turn(opponent1::cards)
round.update_turn(opponent2::cards)
round.update_turn(opponent3::cards)

player1.display_hand

# Deal river
round.deal_common_card
round.update_river(player1::cards)
round.update_river(opponent1::cards)
round.update_river(opponent2::cards)
round.update_river(opponent3::cards)

player1.display_hand