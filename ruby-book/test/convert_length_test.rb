# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/convert_length'

class ConvertLengthTest < Minitest::Test
  def test_convert_length
    assert_in_delta(39.37, convert_length(1, from: :m, to: :in))
    assert_in_delta(0.38, convert_length(15, from: :in, to: :m))
    assert_in_delta(106_70.73, convert_length(35_000, from: :ft, to: :m))
  end
end
