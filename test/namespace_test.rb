# frozen_string_literal: true

require 'minitest/autorun'

module Space1
  class StringNumber
    include Comparable

    def <=>(other)
      @number.to_s <=> other.number.to_s
    end

    def initialize(number)
      @number = number.to_s
    end
    attr_accessor :number
  end
end

module Space2
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
end

class NamespaceTest < Minitest::Test
  def test_string_comparison
    one = Space1::StringNumber.new(1)
    two = Space1::StringNumber.new(2)
    ten = Space1::StringNumber.new(10)

    assert_equal [one, ten, two], [two, one, ten].sort
  end

  def test_number_comparison
    one = Space2::StringNumber.new(1)
    two = Space2::StringNumber.new(2)
    ten = Space2::StringNumber.new(10)

    assert_equal [one, two, ten], [two, one, ten].sort
  end
end
