# frozen_string_literal: true

require 'minitest/autorun'

module M1
  def foo
    1
  end
end

module M2
  extend self
  def foo
    1
  end
end

module M3
  def foo
    1
  end
  module_function :foo
end

class C1
  include M1
end
class C2
  include M2
end
class C3
  include M3
end

class MixinTest < Minitest::Test
  def test_module
    assert_equal false, M1.singleton_methods.include?(:foo)
    assert_equal true,  M1.instance_methods.include?(:foo)

    assert_equal true,  M2.singleton_methods.include?(:foo)
    assert_equal true,  M2.instance_methods.include?(:foo)

    assert_equal true,  M3.singleton_methods.include?(:foo)
    assert_equal false, M3.instance_methods.include?(:foo)
  end

  def test_included_function_will_follow_method_visibility_1
    k = C1.new

    assert_equal true,  k.public_methods.include?(:foo)
    assert_equal false, k.private_methods.include?(:foo)
    assert_equal 1, k.foo
  end

  def test_included_function_will_follow_method_visibility_2
    k = C2.new

    assert_equal true,  k.public_methods.include?(:foo)
    assert_equal false, k.private_methods.include?(:foo)
    assert_equal 1, k.foo
  end

  def test_module_function_will_be_private_in_class
    k = C3.new

    assert_equal false, k.public_methods.include?(:foo)
    assert_equal true,  k.private_methods.include?(:foo)
  end
end
