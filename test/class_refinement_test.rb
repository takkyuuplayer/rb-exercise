# frozen_string_literal: true

require 'minitest/autorun'

class Klass
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  def calc
    @num**2
  end
end

module M
  refine Klass do
    def calc
      @num**3
    end
  end
end

class RefinmentTestNotRefined < Minitest::Test
  def test_refinement
    k = Klass.new(2)

    assert_equal 4, k.calc
  end
end

using M

class RefinmentTestRefined < Minitest::Test
  def test_refinement
    k = Klass.new(2)

    assert_equal 8, k.calc
  end
end
