require_relative './player'
require_relative 'play'
class Round
    attr_accessor :round_number, :pot, :highest_bet

    def initialize
        @round_number = 1
        @pot = 0
        @highest_bet = 0
        @common_cards = []
        @used_cards = []
    end

    def select_card
        suit = ['Heart', 'Diamond', 'Club', 'Spade']
        selected_card = {suit: suit.sample, card: rand(2..14)}
        if @used_cards.include?(selected_card)
            selected_card = select_card
        else
            @used_cards << selected_card
        end
        selected_card
    end

    def display_common_cards
        # puts ' '
        puts 'On the Table:'
        @common_cards.each_index do |index|
          print "#{@common_cards[index][:suit]} #{@common_cards[index][:card]}   "
        end
        puts ' '
    end

    def deal_common_card
        @common_cards << select_card
    end

    def update_flop(hand)
        hand << @common_cards[0]
        hand << @common_cards[1]
        hand << @common_cards[2]
    end

    def update_turn(hand)
        hand << @common_cards[3]
    end

    def update_river(hand)
        hand << @common_cards[4]
    end

    def display_pot
        puts ' '
        puts "Pot:#{@pot}"
    end

    def increase_pot(amount)
        @pot += amount
    end

    def increase_highest_bet(amount)
        @highest_bet = amount unless amount < @highest_bet 
    end

    def reset_round
        puts "Round number: #{@round_number}"
        @round_number += 1
        @pot = 0
        @highest_bet = 0
        @common_cards = []
        @used_cards = []
    end
end
