class Vector2
  attr_reader :x, :y

  def initialize(x_component, y_component)
    @x = x_component
    @y = y_component
  end

  def *(other)
    if other.is_a?(Numeric)
      Vector2.new(@x * other, @y * other)
    elsif other.is_a?(Vector2)
      dot_product(other)
    end
  end

  def dot_product(other_vector)
    @x * other_vector.x + @y * other_vector.y
  end

  def coerce(number)
    [self, number]
  end

  def to_s
    "(#{@x}, #{@y})"
  end
end

v = Vector2.new(3, 4)

puts v * 2
puts v * 2.5
puts v * v
puts 2 * v
puts 2.5 * v
