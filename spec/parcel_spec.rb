require('rspec')
require('parcel')

describe(Parcel) do
  describe('volume') do
    it('will return the volume based on the product of the sides') do
      test_volume = Parcel.new(2,2,6,10, 10)
      expect(test_volume.volume()).to(eq(24))
    end

    it('will return the volume if floats are input') do
      test_volume = Parcel.new(2.2, 2.3, 5, 5.5, 10)
      expect(test_volume.volume()).to(eq(25.3))
    end
    it('will return "nil" if a zero is in any input') do
      test_volume = Parcel.new(0,2,2,2,10)
      expect(test_volume.volume()).to(eq(nil))
    end
    it('will return "nil" if a non number is an input') do
      test_volume = Parcel.new("p",2,2,2,10)
      expect(test_volume.volume()).to(eq(nil))
    end
  end

  describe('rates') do
    it('will return base rate if applicable') do
      test_rate = Parcel.new(2,2,2,2,50)
      expect(test_rate.cost_to_ship()).to(eq(20))
    end
  end
  it('will calculate a new rate if distance is greater than 100') do
    test_rate = Parcel.new(2,2,2,2,150)
    expect(test_rate.cost_to_ship()).to(eq(32.50))
  end
end
