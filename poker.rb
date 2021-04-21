require_relative('./lib/play')

play = Play.new
play.run

# a = [1, 1, 3, 1, 5, 2, 4, 2, 4, 3, 3]
# a.each do | e |
#     if a.count(e) != 2
#         a.delete(e)
#     end
# end

# a = a.sort

# if a.length == 2
#     puts "You have a pair of #{a[0]}!"
# elsif a.length == 4
#     puts "You have a pair of #{a[0]} and #{a[2]}!"
# end