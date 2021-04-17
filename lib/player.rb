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
        # @cards.each_index do |index|
        #     print "#{@cards[index][:suit]} #{@cards[index][:card]}   "
        #   end
        print "#{@cards[0][:suit]} #{@cards[0][:card]}   "
        puts "#{@cards[1][:suit]} #{@cards[1][:card]}"
        puts ' '
    end
    
end
