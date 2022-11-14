# frozen_string_literal: false

require 'minitest/autorun'

class StringTest < Minitest::Test
  def test_sprintf
    assert_equal '2.50000', format('%.5f', 2.5)
    assert_equal '2.40000', format('%.5f', 2.4)
  end

  def test_length
    assert_equal 3, 'abc'.length
  end

  def test_how_similar
    s = 'happyhacker'
    t = 'happyrank'

    same_idx = 0
    (0..t.length).each do |idx|
      t[idx] == s[idx] ? same_idx += 1 : break
    end

    assert_equal 5, same_idx
  end

  def test_how_similar2
    s = 'happyha'
    t = 'happyrank'

    same_idx = 0
    (0..t.length).each do |idx|
      t[idx] == s[idx] ? same_idx += 1 : break
    end

    assert_equal 5, same_idx
  end

  def test_symbol
    str = 'test'
    str2 = 'test'
    sym = :test
    sym2 = :test

    refute str.frozen?
    assert sym.frozen?

    refute_equal str.object_id, str2.object_id
    assert sym.equal?(sym2)
  end
end
