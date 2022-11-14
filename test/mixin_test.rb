# frozen_string_literal: true

require 'minitest/autorun'

module M1
  def foo
    1
  end
end

module M2
  module_function

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

class CI1
  def initialize
    super
    extend M1
  end
end

class MixinTest < Minitest::Test
  def test_module
    refute_includes M1.singleton_methods, :foo
    assert_includes M1.instance_methods, :foo

    assert_includes M2.singleton_methods, :foo
    refute_includes M2.instance_methods, :foo

    assert_includes M3.singleton_methods, :foo
    refute_includes M3.instance_methods, :foo
  end

  def test_included_function_will_follow_method_visibility1
    k = C1.new

    assert_includes k.public_methods, :foo
    refute_includes k.private_methods, :foo
    assert_equal 1, k.foo
  end

  def test_included_function_will_follow_method_visibility2
    k = C2.new

    refute_includes k.public_methods, :foo
    assert_includes k.private_methods, :foo
  end

  def test_module_function_will_be_private_in_class
    k = C3.new

    refute_includes k.public_methods, :foo
    assert_includes k.private_methods, :foo
  end

  def test_extend_in_initialize
    k1 = C1.new
    ki1 = CI1.new

    assert_equal k1.public_methods.sort, ki1.public_methods.sort
    assert_equal k1.private_methods.sort, ki1.private_methods.sort
    assert_equal k1.foo, ki1.foo
  end
end
