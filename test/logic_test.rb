# frozen_string_literal: true

require 'minitest/autorun'

def case_statement(first, second)
  case (first <=> second)
  when -1 then 'a'
  when 0 then 'b'
  when 1 then 'c'
  end
end

class LogicTest < Minitest::Test
  def test_case
    assert_equal 'c', case_statement(5, 3)
  end

  def test_logical_operator
    a = 1 and true

    assert_equal 1, a

    b = true

    assert b
  end
end
