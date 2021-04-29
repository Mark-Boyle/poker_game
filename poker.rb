require_relative('./lib/play')

round = Round.new
play = Play.new(round)
play.run
