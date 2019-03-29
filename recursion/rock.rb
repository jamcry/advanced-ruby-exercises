# make some random rocks
rocks = 30.times.map{ rand(200) + 1 }
puts rocks.join(', ')
max_rock = 0

rocks.each do |rock|
    max_rock = rock if rock > max_rock
end

puts "Heaviest rock is #{max_rock}"

# or with inject
puts "Heaviest rock is #{rocks.inject{ |max_rock, rock| rock > max_rock ? rock : max_rock }}"