# frozen_string_literal: true

require 'minitest/autorun'

class EnumerableTest < Minitest::Test
  def test_inject
    numbers = [1, 2, 3, 4, 5]

    assert_equal 15, numbers.reduce(0) { |sum, n| sum + n } # rubocop:disable Performance/Sum
  end

  def test_each
    numbers = %w[a b c d e]
    ret = ''
    numbers.each { |item| ret += item }

    assert_equal 'abcde', ret
  end

  def test_each_with_index
    numbers = %w[a b c d e]
    ret = ''
    numbers.each_with_index { |item, idx| ret += item + idx.to_s }

    assert_equal 'a0b1c2d3e4', ret
  end

  def test_select
    numbers = [1, 2, 3, 4, 5, 6, 7, 8]

    assert_equal [2, 4, 6, 8], numbers.select(&:even?)
  end
end
