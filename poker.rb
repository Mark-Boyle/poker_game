require_relative('./lib/play')

round = Round.new
play = Play.new(round)
1.times {play.run}