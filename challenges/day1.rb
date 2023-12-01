url = "../files/day1.txt"
data = File.open(url).read

def calibration(data)
    
    numbersArray = data.split("\n")
    .map { |line| line.gsub(/\D/,"") }
    test = numbersArray.map do |number|
        result = [number[0], number[-1]].join.to_i
    end
    test.sum

end


def calibration_2(data)
    string_to_numbers = data.split("\n").map do |line|
        line.gsub(/one/, "o1e")
            .gsub(/two/, "t2o")
            .gsub(/three/, "t3e")
            .gsub(/four/, "f4r")
            .gsub(/five/, "f5e")
            .gsub(/six/, "s6x")
            .gsub(/seven/, "s7n")
            .gsub(/eight/, "e8t")
            .gsub(/nine/, "e9e")
    end

    numbersArray = string_to_numbers.map { |line| line.gsub(/\D/,"") }
    test = numbersArray.map do |number|
        result = []
        result = [number[0], number[-1]].join.to_i
    end
    test.sum
end


p calibration(data)
p calibration_2(data)