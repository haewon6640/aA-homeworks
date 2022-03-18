fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
    'fiiiissshhhhhh']
len = fishes.length

longestFish = ""
fishes.each do |fish1|
    longerFish = fish1
    fishes.each do |fish2|
        if fish2.length > longerFish.length
            longerFish = fish2
        end
    end
    longestFish = longestFish.length > longerFish.length ? longestFish : longerFish
end
p longestFish