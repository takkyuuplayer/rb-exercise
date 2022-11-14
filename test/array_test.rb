# frozen_string_literal: true

require 'minitest/autorun'

class ArrayTest < Minitest::Test
  def test_shift
    numbers = [1, 2, 3, 4, 5]
    assert_equal 1, numbers.shift
    assert_equal [2, 3, 4, 5], numbers
  end

  def test_partial
    assert_equal [1], [1, 2, 3, 4, 5][0..0]
    assert_empty [1, 2, 3, 4, 5][0...0]

    assert_equal [3, 4, 5], [1, 2, 3, 4, 5][(5 / 2)..]
    assert_equal [1, 2], [1, 2, 3, 4, 5][0...(5 / 2)]
  end

  def test_map_itself
    a1 = [1, 2, 3, 4]
    a2 = a1.map(&:itself)

    refute_equal a1.object_id, a2.object_id
  end
end
