url = "./files/day4.txt"
data = File.open(url).read
 
def winning_sum(data)
    winning_cards = []
    data.split("\n").each_with_index do |card|
        card.scan(/(?<=:).*/).map do |gnee|
            gnee.split('|').each do |set|
                winning_cards << set.split(' ')
            end

        end
    end
    cards_sum = 0
    winning_cards.each_with_index do |numbers, index|
        if index.odd?
            numbers
            card_sum = 0
            numbers.each do |number|
                if winning_cards[index - 1].include? number
                    (card_sum == 0) ? card_sum += 1 : card_sum += card_sum 
                end
            end
            cards_sum += card_sum
        end
    end
    cards_sum
end

p winning_sum(data)