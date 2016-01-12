class Parcel
  require('pry')

  define_method(:initialize) do |length, width, height, weight, distance|
    @length = length
    @width = width
    @height = height
    @weight = weight
    @distance = distance
  end

  define_method(:volume) do
    return nil unless valid_entry?
    (@length * @width * @height).round(1)
  end

  define_method(:valid_entry?) do
    (((@length.is_a?(Float) || @length.is_a?(Integer) && @length > 0)) &&\
     ((@width.is_a?(Float) || @width.is_a?(Integer) && @width > 0)) &&\
      ((@height.is_a?(Float) || @height.is_a?(Integer)) && @height > 0))
  end

  define_method(:cost_to_ship) do
    base_rate = { :br_distance => 100, :br_volume => 10 }
    base_rate_plus = { :br => 20, :per_mile => 25, :per_volume => 10 }

    if base_rate?(base_rate)
      return base_rate_plus.fetch(:br)
    else
      return (distance(base_rate) * (base_rate_plus[:per_mile] * 0.01) + base_rate_plus[:br])
    end
  end

  define_method(:base_rate?) do |base_rate|
      @distance < base_rate[:br_distance] && volume < base_rate[:br_volume]
  end

  define_method(:distance) do |base_rate|
    @distance - base_rate[:br_distance]
  end
end
