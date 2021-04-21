class Player
  attr_accessor :chips, :status, :cards

    def initialize(type)
        @chips = 250
        @status = 'In play'
        @cards = []
        @hand_ranking = 0
        @type = type
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
    
    def check_for_pairs
        card_number = organise_card_numbers
        a = card_number.tally
        
        b = a.keep_if{|key, value| value == 2}

        case b.length 
        when 1
            puts "You have a pair of #{b.keys[0]}"
        when 2
            puts "You have a pair of #{b.keys[0]} and #{b.keys[1]}"
        when 3
            puts "You have a pair of #{b.keys[0]} and #{b.keys[1]}"
        end
    end

    def check_for_three_of_a_kind
        card_number = organise_card_numbers
        a = card_number.tally
        b = a.keep_if{|key, value| value == 3}
        puts "You have three of a kind of #{b.keys[0]}" unless b.empty?
    end

    def check_for_four_of_a_kind
        card_number = organise_card_numbers
        a = card_number.tally
        b = a.keep_if{|key, value| value == 4}
        puts "You have four of a kind of #{b.keys[0]}" unless b.empty?
    end

    def check_for_full_house
        card_number = organise_card_numbers
        a = card_number.tally
        b = a.keep_if{|key, value| value == 3 || value == 2}
        puts "You have a full house!" if b.length > 1 && b.value?(3)
    end

    def check_for_straight
        puts 'New player'
        card_number = organise_card_numbers
        card_number.each do | num |
            straight = [num]
            while card_number.include?(num + 1)
                straight << num + 1
                  num += 1
            end
            puts "You have a straight!" if straight.length == 5
        end
    end
end
