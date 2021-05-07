require_relative('./lib/play')

round = Round.new
play = Play.new(round)
4.times {play.run}
