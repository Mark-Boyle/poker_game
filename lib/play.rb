require_relative('./player')
require_relative('round')
require_relative('display')

class Play
  attr_accessor :player1, :opponet1, :opponet2, :opponet3

    def initialize(round)
        @player1 = Player.new('Human', 'Mark      ', round)
        @opponent1 = Player.new('Computer', 'Opponent 1', round)
        @opponent2 = Player.new('Computer', 'Opponent 2', round)
        @opponent3 = Player.new('Computer', 'Opponent 3', round)
        @round = round
    end

    def run
        intro_page
        deal_hand
        @player1.check_holding_cards
        @opponent1.check_holding_cards
        @opponent2.check_holding_cards
        @opponent3.check_holding_cards
        @player1.decide_action
        @opponent1.decide_action
        @opponent2.decide_action
        @opponent3.decide_action
        make_bets
        # sleep(3)
        @player1.display_status
        # sleep(2)
        @opponent1.display_status
        # sleep(2)
        @opponent2.display_status
        # sleep(2)
        @opponent3.display_status
        # sleep(2)
        @round.display_pot
        deal_flop
        @round.display_common_cards
        @player1.analyse_hand
        @opponent1.analyse_hand
        @opponent2.analyse_hand
        @opponent3.analyse_hand
        @player1.decide_action
        @opponent1.decide_action
        @opponent2.decide_action
        @opponent3.decide_action
        make_bets
        # sleep(3)
        puts ' '
        @player1.display_status
        # sleep(2)
        @opponent1.display_status
        # sleep(2)
        @opponent2.display_status
        # sleep(2)
        @opponent3.display_status
        # sleep(2)
        @round.display_pot
        deal_turn
        @round.display_common_cards
        @player1.analyse_hand
        @opponent1.analyse_hand
        @opponent2.analyse_hand
        @opponent3.analyse_hand
        @player1.decide_action
        @opponent1.decide_action
        @opponent2.decide_action
        @opponent3.decide_action
        make_bets
        # sleep(1)
        puts ' '
        @player1.display_status
        @opponent1.display_status
        @opponent2.display_status
        @opponent3.display_status
        # sleep(1)
        @round.display_pot
        puts ' '
        deal_river
        @round.display_common_cards
        @player1.analyse_hand
        @opponent1.analyse_hand
        @opponent2.analyse_hand
        @opponent3.analyse_hand
        @player1.decide_action
        @opponent1.decide_action
        @opponent2.decide_action
        @opponent3.decide_action
        make_bets
        # sleep(1)
        puts ' '
        @player1.display_status
        @opponent1.display_status
        @opponent2.display_status
        @opponent3.display_status
        # sleep(1)
        @round.display_pot
        puts ' '
        @player1.display_winning_combination
        @opponent1.display_winning_combination
        @opponent2.display_winning_combination
        @opponent3.display_winning_combination
        pick_winner
        # sleep(1)
        puts "Pot: #{@round::pot}"
        @player1.display_chips
        @opponent1.display_chips
        @opponent2.display_chips
        @opponent3.display_chips
        finish_round
    end

   
    def deal_hand
        # puts "Player 1 cards:"
        @player1::cards << @round.select_card
        @player1::cards << @round.select_card
        @player1.display_hand
        # puts 'Opponent 1 cards:'
        @opponent1::cards << @round.select_card
        @opponent1::cards << @round.select_card
        @opponent1.display_hand
        # puts 'Opponent 2 cards:'
        @opponent2::cards << @round.select_card
        @opponent2::cards << @round.select_card
        @opponent2.display_hand
        # puts 'Opponent 3 cards:'
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


    def pick_winner
        players = [@player1, @opponent1, @opponent2, @opponent3]
        winner = [@player1::winning_combinations[0],
        @opponent1::winning_combinations[0],
        @opponent2::winning_combinations[0],
        @opponent3::winning_combinations[0]]
        # puts @player1::winning_combinations
        winner.sort_by!{|k| k[:rank]}
        puts winner
        puts ' '
        # puts @player1::hand_ranking
        # puts @opponent1::hand_ranking
        # puts @opponent2::hand_ranking
        # puts @opponent3::hand_ranking
        puts "The winner is #{winner[0][:name]}"
        players.each_index {| i | puts players[i]::name == winner[0][:name] ? players[i]::chips += @round::pot : false} 
            # == winner[0][:name] ? puts "#{players[i]::chips}" : puts 'no name'}
        # players[0]::name == winner[0][:name]
    end

    def make_bets
        players = [@player1, @opponent1, @opponent2, @opponent3]
        players.each do |player| 
            if player::status == 'In Play' && player::player_bet != @round::highest_bet
                player.check_or_call
            end
        end
        # puts 'test'
        # puts players.length unless players.length == nil
        # puts players[0]::status
        
        # puts 'test'
      
        # while players[0]::player_bet != players[-1]::player_bet
        #     @player1.decide_action
        #     @opponent1.decide_action
        #     @opponent2.decide_action
        #     @opponent3.decide_action
        #     players.each{| player | players.delete(player) unless player::status != 'Folded'}
        # end

        # 4.times do
        #     @player1.decide_action
        #     @opponent1.decide_action
        #     @opponent2.decide_action
        #     @opponent3.decide_action
        # end

    end

    def finish_round
        @player1.reset_player
        @opponent1.reset_player
        @opponent2.reset_player
        @opponent3.reset_player
        @round.reset_round
    end
end
