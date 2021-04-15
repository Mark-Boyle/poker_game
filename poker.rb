require_relative('./lib/round')
require_relative('./lib/player')

player = Player.new
round = Round.new

puts round.deal_two_cards


# status = 'trying'
# while status == 'trying'
#     puts 'Try again?'
#     input = gets
#     if input == 'n'
#         exit
#     else 
#         round.select_card
#         round.display_common_cards
#     end
# end