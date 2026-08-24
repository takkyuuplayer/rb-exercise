# frozen_string_literal: true

require 'minitest/autorun'

class Point
  @some = 0

  def initialize(p_x, p_y)
    @x = p_x
    @y = p_y
  end
  attr_accessor :x, :y

  def distance_from_origin
    Math.hypot(@x, @y)
  end

  def distance(point = nil)
    return Math.hypot(@x, @y) if point.nil?

    Math.hypot(point.x - @x, point.y - @y)
  end

  def self.some(some = nil)
    some.nil? ? @some : @some = some
  end
end

class ChildPoint < Point
  def distance(point)
    [super, super(), super(point)] # rubocop:disable Style/SuperArguments
  end
end

class PointTest < Minitest::Test
  def test_instance
    point = Point.new(3, 4)

    assert_equal 3, point.x
    assert_equal 4, point.y

    assert_equal 5, point.distance_from_origin
  end

  def test_class
    assert_equal 0, Point.some

    Point.some(1)

    assert_equal 1, Point.some
  end

  def test_super
    p1 = ChildPoint.new(3, 4)
    p2 = ChildPoint.new(3, 0)

    distances = p1.distance(p2)

    assert_equal 4, distances[0]
    assert_equal 5, distances[1]
    assert_equal 4, distances[2]
  end
end
