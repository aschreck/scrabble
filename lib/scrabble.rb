class Scrabble

  def score(word)
    return 0 if word.nil?
    values = point_values
    word = word.upcase
    sum = 0
    word.each_char do |char|
      sum += values[char]
    end
    sum
  end

  def score_with_multipliers(word, board_array, multiplier = 1)
    word = word.upcase
    values = point_values

    word_values = []
    word.each_char do |char|
      word_values.push(values[char])
    end

    adjusted_score = word_values.zip(board_array).map{|x, y| x * y}
    answer = adjusted_score.inject(0){|sum,x| sum + x }
    answer += 10 if word.length > 6
    return answer * multiplier

  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end
end
