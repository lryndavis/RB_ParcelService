require('rspec')
require('parcel')

describe(Parcel) do
  describe('volume') do
    it('will return the volume based on the product of the sides') do
      test_volume = Parcel.new(2,2,6,10)
      expect(test_volume.volume()).to(eq(24))
    end

    it('will return the volume if floats are input') do
      test_volume = Parcel.new(2.2, 2.3, 5, 5.5)
      expect(test_volume.volume()).to(eq(25.3))
    end
  end
end
