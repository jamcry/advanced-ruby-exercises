def beers(n)
    if n == 0
        puts "No more bottles of beer on the wall"
    else
        puts "#{n} bottles of beer on the wall"
        beers(n-1)
    end
end

beers(3)