class Player
  attr_accessor :chips, :status, :cards, :winning_combinations

    def initialize(type, name)
        @name = name
        @chips = 250
        @status = 'In play'
        @cards = []
        @hand_ranking = 0
        @type = type
        @winning_combinations = []
        @high_card = 0
    end

    def display_hand
        puts 'Player hand:'
        print "#{@cards[0][:suit]} #{@cards[0][:card]}   "
        puts "#{@cards[1][:suit]} #{@cards[1][:card]}"
        puts ' '
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
    end

    def display_winning_combination
        puts ' '
        @winning_combinations.sort_by!{|k| k[:rank]}
        puts @winning_combinations[0][:message] unless @winning_combinations.empty?
    end

    def winning_combination
        [@winning_combinations[0][:rank], @winning_combinations[0][:name]]
    end

    def check_holding_cards
        if @cards[0][:card] > @cards[1][:card]
            @high_card = @cards[0][:card]
        else
            @high_card = @cards[1][:card]
        end
        @winning_combinations << {rank: 10 - (@high_card * 0.01), message: "You have #{@high_card}-high", name: @name}
    end
    
    def check_for_pairs
        card_number = organise_card_numbers
        a = card_number.tally
        
        b = a.keep_if{|key, value| value == 2}

        case b.length 
        when 1
            @winning_combinations << {rank: 9 - (b.keys.max * 0.01) - (b.keys.min * 0.0001), message: "You have a pair of #{b.keys[0]}", name: @name}
        when 2
            @winning_combinations << {rank: 8 - (b.keys.max * 0.01) - (b.keys.min * 0.0001), message: "You have a pair of #{b.keys[0]} and #{b.keys[1]}", name: @name}
        when 3
            @winning_combinations << {rank: 8 - (b.keys.max * 0.01) - (b.keys.min * 0.0001), message: "You have a pair of #{b.keys[0]} and #{b.keys[1]}", name: @name}
        end
    end

    def check_for_three_of_a_kind
        card_number = organise_card_numbers
        a = card_number.tally
        b = a.keep_if{|key, value| value == 3}
        @winning_combinations << {rank: 7 - (b.keys.max * 0.01), message: "You have three of a kind of #{b.keys[0]}", name: @name}  unless b.empty?
    end

    def check_for_four_of_a_kind
        card_number = organise_card_numbers
        a = card_number.tally
        b = a.keep_if{|key, value| value == 4}
        @winning_combinations << {rank: 3 - (b.keys.max * 0.01), message: "You have four of a kind of #{b.keys[0]}", name: @name} unless b.empty?
    end

    def check_for_full_house
        card_number = organise_card_numbers
        a = card_number.tally
        b = a.keep_if{|key, value| value == 3 || value == 2}
        c = a.keep_if{|key, value| value == 3}
        @winning_combinations << {rank: 4 - (c.keys.max * 0.01), message: "You have a full house!", name: @name} if b.length > 1 && b.value?(3)
    end

    def check_for_straight
        card_number = organise_card_numbers
        card_number.each do | num |
            straight = [num]
            while card_number.include?(num + 1)
                straight << num + 1
                  num += 1
            end
            @winning_combinations << {rank: 6 - (straight.max * 0.01), message: "You have a straight!", name: @name} if straight.length == 5
        end
    end

    def check_for_flush
        card_suits = organise_suits
        a = card_suits.tally 
        b = a.keep_if{|key, value| value >= 5}
        c = b.keys
        @winning_combinations << {rank: 5, message: "You have a flush!", name: @name} unless b.empty?
    end
end
