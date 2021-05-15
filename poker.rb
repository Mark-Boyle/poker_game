require_relative('./lib/play')

round = Round.new
play = Play.new(round)
100.times {play.run}