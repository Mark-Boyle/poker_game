# require_relative '../poker'
class Player
  attr_accessor :chips, :status, :cards

    def initialize(type)
        @chips = 250
        @status = 'In play'
        @cards = []
        @hand_ranking
        @type = type
    end

    def display_hand
        puts 'Player hand:'
        @cards.each_index do |index|
            print "#{@cards[index][:suit]} #{@cards[index][:card]}   "
          end
          puts ' '
    end

    def display_cards
        @cards
    end

end
