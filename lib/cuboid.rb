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

  #
  # PRIVATE METHODS
  #

  private

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
