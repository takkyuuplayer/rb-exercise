# frozen_string_literal: true

require 'minitest/autorun'

class TestBasic < Minitest::Test
  def test_string
    hello = 'hello'
    world = ' world'

    assert_equal 'hello world', hello + world
  end

  def test_string_as_array
    cattle = 'yahoo'

    assert_equal 'a', cattle[1]
  end

  def test_array
    a = 1
    b = 'str'
    c = [a, b, 3, 'test']

    assert_equal [1, 'str', 3, 'test'], c

    assert_equal a, c[0]
    assert_equal 'test', c[-1]

    assert_equal [1, 'str'], c[0..1]
    assert_equal [1], c[0...1]

    assert_equal 4, c.length
    assert_equal 4, c.size
  end

  def test_array_method
    c = [1, 5, 2, 4, 3]

    assert_equal 5, c.length
    assert_equal 5, c.size

    assert_equal [1, 2, 3, 4, 5], c.sort
    assert_equal [1, 5, 2, 4, 3], c

    assert_equal [1, 5, 2, 4, 3, 1, 5, 2, 4, 3], c * 2
  end
end
