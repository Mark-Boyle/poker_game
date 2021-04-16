# require_relative '../poker'
class Player
  attr_accessor :chips, :status, :cards

    def initialize
        @chips = 250
        @status = 'In play'
        @cards = []
    end

    def display_hand
        puts 'Player hand:'
        # convert_card_name
        puts "#{@cards[0][:suit]} #{@cards[0][:card]}" 
        puts "#{@cards[1][:suit]} #{@cards[1][:card]}"
    end

    # def convert_card_name
    #     case @cards[0][:card]
    #     when 11
    #         return 'Jack'
    #     when 12
    #         return 'Queen'
    #     when 13
    #         return 'King'
    #     when 14
    #         return 'Ace'
    #     end
    # end
end
