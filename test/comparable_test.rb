# frozen_string_literal: true

require 'minitest/autorun'

class StringNumber
  include Comparable

  def <=>(other)
    @number.to_i <=> other.number.to_i
  end

  def initialize(number)
    @number = number.to_s
  end
  attr_accessor :number
end

class MixinTest < Minitest::Test
  def test_mixin
    one = StringNumber.new(1)
    two = StringNumber.new(2)
    ten = StringNumber.new(10)

    assert_equal [one, two, ten], [two, one, ten].sort
  end
end
