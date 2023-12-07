url = "./files/day6.txt"
data = File.open(url).read

def race(data)
    test = []
    scores = data.split("\n").map { |line| line.scan(/(\d+)/) }
    scores[0].each_with_index do |score, index| 
        time = score.first.to_i
        winning_time = (1...time).to_a.map do |number|
            release_time = time - number
            release_time * number
        end
        # p winning_time
        test << winning_time.select { |score| score > scores[1][index].first.to_i  }.size
    end
    test.inject(:*)
end

def race_2(data)
    result = []
    scores = data.split("\n").map { |line| line.scan(/(\d+)/).join }
    time = scores.first.to_i
    distance = scores.last.to_i
    winning_time = (1..time).to_a.map do |number|
        release_time = time - number
        release_time * number
    end
    result << winning_time.select { |score| score > distance}.size
    result
end


race(data)
p race_2(data)