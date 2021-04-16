require_relative('./round')
require_relative('./player')

class Player
attr_accessor :chips, :status, :cards

    def initialize
        @chips = 250
        @status
        @cards = []
    end

end