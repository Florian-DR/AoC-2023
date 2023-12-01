url = "../files/day1.txt"
data = File.open(url).read

def calibration(data)
    
    answer = data.split("\n").map do |line| 
        numbers = line.gsub(/\D/,"") 
        [numbers[0], numbers[-1]].join.to_i
    end
    answer.sum

end


def calibration_2(data)
    answer = data.split("\n").map do |line|
        numbers = line.gsub(/one/, "o1e")
                     .gsub(/two/, "t2o")
                     .gsub(/three/, "t3e")
                     .gsub(/four/, "f4r")
                     .gsub(/five/, "f5e")
                     .gsub(/six/, "s6x")
                     .gsub(/seven/, "s7n")
                     .gsub(/eight/, "e8t")
                     .gsub(/nine/, "e9e")
                     .gsub(/\D/,"")
        [numbers[0], numbers[-1]].join.to_i
    end

    answer.sum
end


p calibration(data)
p calibration_2(data)