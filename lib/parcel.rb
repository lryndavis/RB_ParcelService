class Parcel

  define_method(:initialize) do |length, width, height, weight|
    @length = length
    @width = width
    @height = height
    @weight = weight
  end

  define_method(:volume) do
    (@length * @width * @height).round(1)
  end
end
