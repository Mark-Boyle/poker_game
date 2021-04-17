require_relative './player'
class Round
    attr_accessor :round_number, :pot, :bet

    def initialize
        @round_number = 1
        @pot = 0
        @bet = 3
        @common_cards = []
        @used_cards = []
    end

    def select_card
        suit = ['Heart', 'Diamond', 'Club', 'Spade']
        selected_card = {suit: suit.sample, card: rand(2..14)}
        if @used_cards.include?(selected_card)
            select_card
        else
            @used_cards << selected_card
        end
        selected_card
    end

    def display_common_cards
        puts ' '
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

    # def deal_river
    #     @common_cards << select_card
    #     @common_cards << select_card
    #     @common_cards << select_card
    # end

    # def deal_turn
    #     @common_cards << select_card
    # end

    # def deal_flop
    #     @common_cards << select_card
    # end
end
