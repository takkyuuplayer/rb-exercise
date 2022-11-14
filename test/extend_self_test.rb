# frozen_string_literal: true

require 'minitest/autorun'

module Foo
  module_function

  def foo
    1
  end
end

module Bar
  def bar
    1
  end
end

class ExtendSelfTest < Minitest::Test
  def test_with_extend
    assert_equal true, Foo.singleton_methods.include?(:foo)
    assert_equal true, Foo.instance_methods.include?(:foo)
  end

  def test_without_extend
    assert_equal false, Bar.singleton_methods.include?(:bar)
    assert_equal true, Bar.instance_methods.include?(:bar)
  end
end
