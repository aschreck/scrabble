gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter

    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_test_a_word

    assert_equal 3, Scrabble.new.score("ant")
    assert_equal 11,  Scrabble.new.score("doggeral")
  end

  def test_it_handles_nil_and_empty

    assert_equal 0, Scrabble.new.score(nil)
    assert_equal 0, Scrabble.new.score("")
  end 
end
