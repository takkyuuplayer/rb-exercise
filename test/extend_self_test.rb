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
    assert_includes Foo.singleton_methods, :foo
    assert_includes Foo.instance_methods, :foo
  end

  def test_without_extend
    refute_includes Bar.singleton_methods, :bar
    assert_includes Bar.instance_methods, :bar
  end
end
