class Cuboid

  #
  # PUBLIC METHODS
  #

  def initialize(origin, volume)
    raise(ArgumentError, 'origin is invalid') unless origin? origin
    raise(ArgumentError, 'volume is invalid') unless volume? volume

    @origin = origin
    @volume = volume
  end

  def move_to!(origin)
    raise(ArgumentError, 'origin is invalid') unless origin? origin

    @origin = origin
  end

  def vertices
    points = []

    2.times do |a|
      2.times do |b|
        2.times do |c|
          points.push({x: calc(:x, :width, a), y: calc(:y, :height, b), z: calc(:z, :length, c)})
        end
      end
    end

    points
  end

  def intersects?(other)
    raise(ArgumentError, 'other is invalid') unless other.is_a? Cuboid

    vertices1 = self.vertices
    vertices2 = other.vertices

    ![:x, :y, :z].any? do |axis|
      clear?(axis, vertices1, vertices2)
    end
  end

  #
  # PRIVATE METHODS
  #

  private

  def calc(axis, dimension, value)
    @origin[axis] + (value.odd? ? 1 : -1)  * @volume[dimension].fdiv(2)
  end

  def clear?(axis, vertices1, vertices2)
    2.times.any? do |num|
      vertices1.all? do |v1|
        vertices2.all? {|v2| num.odd? ? v1[axis] > v2[axis] : v1[axis] < v2[axis]}
      end
    end
  end

  def origin?(origin)
    hash?(origin, [:x, :y, :z])
  end

  def volume?(volume)
    hash?(volume, [:width, :height, :length])
  end

  def hash?(hash, keys)
    hash.is_a?(Hash) && keys.all? do |key|
      hash.key?(key) && hash[key].is_a?(Fixnum) && hash[key] >= 0
    end
  end

end
