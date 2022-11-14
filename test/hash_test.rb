# frozen_string_literal: false

require 'minitest/autorun'

class HashTest < Minitest::Test
  def test_hash
    numbers = {
      'one' => 1,
      'two' => 2,
      'three' => 3
    }

    assert_equal 1, numbers['one']

    assert_equal 3, numbers.keys.length

    numbers['four'] = 4

    assert_equal 4, numbers.keys.length
  end

  def test_hash_with_default
    h = Hash.new('default')

    assert_equal h[1], 'default'
    assert_equal h[5], 'default'

    h[1] << 'bar'

    assert_equal h[1], 'defaultbar'
    assert_equal h[5], 'defaultbar'
    assert_equal h[6], 'defaultbar'
  end

  def test_hash_with_default_block
    h = Hash.new { |hash, key| hash[key] = 'default' }

    assert_equal h[1], 'default'
    assert_equal h[5], 'default'

    h[1] << 'bar'

    assert_equal h[1], 'defaultbar'
    assert_equal h[5], 'default'
    assert_equal h[6], 'default'
  end

  def test_to_proc
    h = { a: 1, b: 2, c: 3 }
    hp = h.to_proc

    assert_instance_of Proc, hp
    assert_equal 1, hp[:a]
    assert_equal 1, hp.call(:a)
  end

  def test_to_square
    assert_equal 1, square(1)
    assert_equal 4, square(2)
    assert_equal 100, square(5)
  end

  def square(num)
    @squares ||= { 5 => 100 }
    @squares[num] ||= num**2
  end
end
