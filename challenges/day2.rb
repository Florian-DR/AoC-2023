url = "./files/day2.txt"
data = File.open(url).read

RED = 12
GREEN = 13
BLUE = 14

class Game
    attr_accessor :id, :possible

    def initialize(id, colors)
        @id = id
        @green = 0
        @red = 0
        @bleu = 0
        @possible = true
        filter(colors)
    end

    def set_bleu(bleu)
        @bleu = bleu if @bleu < bleu
        @possible = false if bleu > BLUE
    end

    def set_red(red)
        @red = red if @red < red
        @possible = false if red > RED
    end

    def set_green(green)
        @green = green if @green < green
        @possible = false if green > GREEN
    end

    # Only needed for Second part
    def power
        @green * @bleu * @red
    end

    private 

    def filter(colors)
        colors.each_with_index do |color, index| 
            case color
            when "blue"
                set_bleu(colors[index-1].to_i)
            when "red"
                set_red(colors[index-1].to_i)
            when "green"
                set_green(colors[index-1].to_i)
            end
        end
    end
end

def possible_games(data)
    games = {}
    
    data.split("\n").each do |game| 
        game_array = game.gsub("Game ", "").split(": ")
        games[game_array[0]] = game_array[1].gsub(", ", "-")
                                            .gsub(" ", "-")
                                            .gsub("; ", "-")
                                            .gsub(";", "")
                                            .split("-")
    end

    # Part 1 of the puzzle
    sum = 0
    games.each do |game|
        gaming = Game.new(game[0].to_i, game[1])
        sum += gaming.id if gaming.possible == true
    end
    puts "Part 1: #{sum}" 

    # Part 2 of the puzzle
    sum2 = 0
    games.each do |game|
        sum2 += Game.new(game[0].to_i, game[1])
                    .power
    end
    puts "Part 2: #{sum2}"
end

possible_games(data)