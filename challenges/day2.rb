url = "./files/day2.txt"
data = File.open(url).read

RED = 12
GREEN = 13
BLUE = 14

class Game
    attr_accessor :id, :possible

    def initialize(id, array)
        @id = id
        @green = 0
        @red = 0
        @bleu = 0
        @possible = true
        filter(array)
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

    private 

    def filter(array)
        array.each_with_index do |element, index| 
            case element
            when "blue"
                set_bleu(array[index-1].to_i)
            when "red"
                set_red(array[index-1].to_i)
            when "green"
                set_green(array[index-1].to_i)
            end
        end
    end
end


def possible_games(data)
    games = {}
    
    data.split("\n").each do |game| 
        game_array = game.gsub("Game ", "").split(": ")
        games[game_array[0]] = game_array[1].gsub(", ", "-").gsub(" ", "-").gsub("; ", "-").gsub(";", "").split("-")
    end
    gamesssss = games.map do |game|
        Game.new(game[0].to_i, game[1])
    end
    sum = 0
    gamesssss.each do |game|
        sum += game.id if game.possible == true
    end
    sum
end

p possible_games(data)