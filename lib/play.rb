require_relative('./player')
require_relative('round')

class Play
  attr_accessor :player1, :opponet1, :opponet2, :opponet3

    def initialize(round)
        @player1 = Player.new('Human', 'Mark', round)
        @opponent1 = Player.new('Computer', 'Opponent 1', round)
        @opponent2 = Player.new('Computer', 'Opponent 2', round)
        @opponent3 = Player.new('Computer', 'Opponent 3', round)
        @round = round
    end

    def run
        deal_hand
        @player1.check_holding_cards
        @opponent1.check_holding_cards
        @opponent2.check_holding_cards
        @opponent3.check_holding_cards
        @player1.decide_action
        @opponent1.decide_action
        @opponent2.decide_action
        @opponent3.decide_action
        @round.display_pot
        deal_flop
        @player1.analyse_hand
        @opponent1.analyse_hand
        @opponent2.analyse_hand
        @opponent3.analyse_hand
        @player1.decide_action
        @opponent1.decide_action
        @opponent2.decide_action
        @opponent3.decide_action
        @round.display_common_cards
        @round.display_pot
        deal_turn
        @player1.analyse_hand
        @opponent1.analyse_hand
        @opponent2.analyse_hand
        @opponent3.analyse_hand
        @player1.decide_action
        @opponent1.decide_action
        @opponent2.decide_action
        @opponent3.decide_action
        @round.display_common_cards
        @round.display_pot
        deal_river
        @player1.analyse_hand
        @opponent1.analyse_hand
        @opponent2.analyse_hand
        @opponent3.analyse_hand
        @player1.decide_action
        @opponent1.decide_action
        @opponent2.decide_action
        @opponent3.decide_action
        @round.display_common_cards
        @round.display_pot
        @player1.analyse_hand
        @opponent1.analyse_hand
        @opponent2.analyse_hand
        @opponent3.analyse_hand
        @player1.decide_action
        @opponent1.decide_action
        @opponent2.decide_action
        @opponent3.decide_action
     
        @player1.display_winning_combination
        @opponent1.display_winning_combination
        @opponent2.display_winning_combination
        @opponent3.display_winning_combination
        pick_winner
        puts "Pot: #{@round::pot}"
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

    def display_pot
        puts "Pot: #{@pot}"
    end

    def pick_winner
        
        winner = [@player1::winning_combinations[0],
        @opponent1::winning_combinations[0],
        @opponent2::winning_combinations[0],
        @opponent3::winning_combinations[0]]
        # puts @player1::winning_combinations
        winner.sort_by!{|k| k[:rank]}
        puts 'After sorting'
        puts winner
        puts @player1::hand_ranking
        puts @opponent1::hand_ranking
        puts @opponent2::hand_ranking
        puts @opponent3::hand_ranking
        puts "The winner is #{winner[0][:name]}"
    end

    
end
