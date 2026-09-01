# frozen_string_literal: true

require 'minitest/autorun'

class NumberTest < Minitest::Test
  def test_bit_shift
    assert_equal 4, 1 << 2
  end

  # rubocop:disable-next Minitest/AssertInDelta
  def test_float
    assert_equal 4.5, 2.0 + 2.5
    assert_equal 4.6, 2.0 + 2.6
    assert_equal 5, 2.4 + 2.6
  end

  # rubocop:disable-next Minitest/AssertTruthy, Minitest/RefuteFalse
  def test_infinite
    assert_equal true, (1.0 / 0.0).positive?

    assert_equal 1, (1.0 / 0.0).infinite?
    assert_nil(-1.0.infinite?)
    assert_equal(-1, (-1.0 / 0.0).infinite?)

    assert_equal false, (1.0 / 0.0).finite?
    assert_equal(true, -1.0.finite?)
    assert_equal false, (-1.0 / 0.0).finite?
  end

  def test_comparison
    assert_equal 1 <=> 2, -1
    assert_equal 1 <=> 1, 0 # rubocop:disable Lint/BinaryOperatorWithIdenticalOperands
    assert_equal 1 <=> 0, 1
  end

  def test_bignum
    assert_equal 0x3FFFFFFF.class, Integer
    assert_equal (0x3FFFFFFF * 2).class, Integer
  end

  def test_round
    assert_equal 2, 1.5.round
  end

  def test_floor
    assert_equal 1, 1.5.floor
  end

  def test_abs
    assert_equal 1, -1.abs
  end

  def test_max; end
end
