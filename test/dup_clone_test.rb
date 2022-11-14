# frozen_string_literal: true

require 'minitest/autorun'

class Klass2
  attr_accessor :num

  def initialize(num)
    @num = num
  end
end

class DupCloneTest < Minitest::Test
  def test_clone_will_copy_singular_method_or_frozen_state
    k = Klass2.new(2)

    def k.square
      @num**2
    end
    k.freeze

    assert_equal 4, k.square
    assert k.frozen?

    cloned = k.clone

    assert_includes cloned.methods, :square
    assert cloned.frozen?
  end

  def test_dup_will_not_copy_singular_method_or_frozen_state
    k = Klass2.new(2)

    def k.square
      @num**2
    end
    k.freeze

    assert_includes k.methods, :square
    assert k.frozen?

    duped = k.dup

    refute_includes duped.methods, :square
    refute duped.frozen?
  end
end
