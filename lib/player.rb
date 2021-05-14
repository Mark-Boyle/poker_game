require_relative 'play'
require_relative 'round'

class Player
  attr_accessor :chips, :status, :cards, :winning_combinations, :hand_ranking, :player_bet, :name, :max_bet, :round

    def initialize(type, name, round)
        @name = name
        @chips = 250
        @status = 'In Play'     #Options include: 'In Play', 'Folded ', 'Out', 'All In'
        @cards = []
        @hand_ranking = 0
        @type = type
        @winning_combinations = []
        @high_card = 0
        @player_bet = 0
        @max_bet = @player_bet + 20
        @round = round
    end

    def display_hand
        puts "#{@name}:"
        print "#{@cards[0][:suit]} #{@cards[0][:card]}   "
        puts "#{@cards[1][:suit]} #{@cards[1][:card]}"
        puts ' '
    end

    def display_status
        puts "#{@name}   status: #{@status}    Hand Rank: #{@hand_ranking - @cards.length}   Bet:#{@player_bet}"
    end

    def display_chips
        puts "#{@name}: #{@chips}"
    end

    def reset_player
        @status = 'In Play' unless @status == 'Out'
        @cards = []
        @hand_ranking = 0
        @winning_combinations = []
        @high_card = 0
        @player_bet = 0
    end

    def organise_card_numbers
        card_number = []
        @cards.each_index do | e |
            card_number << @cards[e][:card]
            end
        card_number.sort!.reverse!
    end

    def organise_suits
        card_suits = []
        @cards.each_index do | e |
            card_suits << @cards[e][:suit]
            end
        card_suits
    end

    def analyse_hand
        check_for_pairs
        check_for_three_of_a_kind
        check_for_four_of_a_kind
        check_for_full_house
        check_for_straight
        check_for_flush
        check_for_straight_flush
    end

    def display_winning_combination
        # puts ' '
        @winning_combinations.sort_by!{|k| k[:rank]}
        # puts @winning_combinations[0][:message] unless @winning_combinations.empty?
    end

    # def winning_combination
    #     [@winning_combinations[0][:rank], @winning_combinations[0][:name]]
    # end

    def check_holding_cards
        if @cards[0][:card] > @cards[1][:card]
            @high_card = @cards[0][:card]
        else
            @high_card = @cards[1][:card]
        end
        @winning_combinations << {rank: 10 - (@high_card * 0.01), message: "You have #{@high_card}-high", name: @name, status: @status}
        @hand_ranking =  @cards[0][:card] + @cards[1][:card]
        @hand_ranking += 20 unless @cards[0][:card] != @cards[1][:card] 
        # puts @hand_ranking
    end
    
    def check_for_pairs
        card_number = organise_card_numbers
        a = card_number.tally
        
        b = a.keep_if{|key, value| value == 2}

        case b.length 
        when 1
            @winning_combinations << {rank: ((9 - (b.keys.max * 0.01)) - (b.keys.min * 0.0001)).round(4), message: "You have a pair of #{b.keys[0]}", name: @name, status: @status}
            @hand_ranking += 20
        when 2
            @winning_combinations << {rank: ((8 - (b.keys.max * 0.01)) - (b.keys.min * 0.0001)).round(4), message: "You have a pair of #{b.keys[0]} and #{b.keys[1]}", name: @name, status: @status}
            @hand_ranking += 40
        when 3
            @winning_combinations << {rank: ((8 - (b.keys.max * 0.01)) - (b.keys.min * 0.0001)).round(4), message: "You have a pair of #{b.keys[0]} and #{b.keys[1]}", name: @name, status: @status}
            @hand_ranking += 40
        end
    end

    def check_for_three_of_a_kind
        card_number = organise_card_numbers
        a = card_number.tally
        b = a.keep_if{|key, value| value == 3}
        @winning_combinations << {rank: 7 - (b.keys.max * 0.01), message: "You have three of a kind of #{b.keys[0]}", name: @name, status: @status}  unless b.empty?
        @hand_ranking += 60 unless b.empty?
    end

    def check_for_four_of_a_kind
        card_number = organise_card_numbers
        a = card_number.tally
        b = a.keep_if{|key, value| value == 4}
        @winning_combinations << {rank: 3 - (b.keys.max * 0.01), message: "You have four of a kind of #{b.keys[0]}", name: @name, status: @status} unless b.empty?
        @hand_ranking += 80 unless b.empty?
    end

    def check_for_full_house
        card_number = organise_card_numbers
        a = card_number.tally
        b = a.keep_if{|key, value| value == 3 || value == 2}
        # c = a.keep_if{|key, value| value == 3}
        @winning_combinations << {rank: 4 - (b.keys.max * 0.01), message: "You have a full house!", name: @name, status: @status} if b.length > 1 && b.value?(3)
        @hand_ranking += 70 if b.length > 1 && b.value?(3)
    end

    def check_for_straight
        card_number = organise_card_numbers
        card_number.each do | num |
            straight = [num]
            while card_number.include?(num + 1)
                straight << num + 1
                  num += 1
            end
            @winning_combinations << {rank: 6 - (straight.max * 0.01), message: "You have a straight!", name: @name, status: @status} if straight.length == 5
            @hand_ranking += 50  unless straight.length != 5
        end
    end

    def check_for_flush
        card_suits = organise_suits
        a = card_suits.tally 
        b = a.keep_if{|key, value| value >= 5}
        # c = b.keys
        @winning_combinations << {rank: 5, message: "You have a flush!", name: @name, status: @status} unless b.empty?
        @hand_ranking += 60 unless b.empty?
    end

    def check_for_straight_flush
        ranks = []
        @winning_combinations.each_index do | e |
            ranks << @winning_combinations[e][:rank]
        end
        ranks = ranks.map!{ | num | num.to_i}
        if ranks.include?(4) && ranks.include?(5)
            @winning_combinations << {rank: 2, message: "You have a straight flush!", name: @name, status: @status}
            @hand_ranking += 90
        end
    end

    def decide_action
        if @status == 'In Play'
            a = @hand_ranking - (@cards.length)
            case a
            when 0..9
                fold
            when 10..14
                check_or_call
            when 15..30
                low_bet
            when 31..50
                medium_bet
            when 50..300 
                high_bet
            end
        end
    end

    def fold
        @status = 'Folded '
    end

    def check_or_call
        @round.increase_pot(@round::highest_bet - @player_bet)
        @chips -= (@round::highest_bet - @player_bet)
        @max_bet < @round::highest_bet ? fold : @player_bet = @round::highest_bet
        
    end

    def low_bet
        @player_bet += 20
        if @player_bet < @round::highest_bet
            check_or_call
        else
            @round.increase_pot(20)
            @chips -= 20
        end
        @round.increase_highest_bet(@player_bet)
    end

    def medium_bet
        @player_bet += 30
        if @player_bet < @round::highest_bet 
            check_or_call
        else
            @round.increase_pot(30)
            @chips -= 30
        end
        @round.increase_highest_bet(@player_bet)
    end

     def high_bet
        @player_bet += 40
        if @player_bet < @round::highest_bet
             check_or_call
        else
            @round.increase_pot(40)
            @chips -= 40
        end
        @round.increase_highest_bet(@player_bet)
    end

     def all_in
        @round.increase_pot(@chips)
        @player_bet += @chips
        @chips == 0
        @round::highest_bet = @player_bet unless @player_bet < @round::highest_bet
        @status = 'All In'
     end
end