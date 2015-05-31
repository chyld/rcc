require 'cuboid'

describe Cuboid do

  subject do
    origin = {x: 4, y: 5, z: 6}
    volume = {width: 2, height: 3, length: 4}
    Cuboid.new(origin, volume)
  end

  describe "new" do
    it "creates a Cuboid" do
      expect(subject).to be_a Cuboid
    end

    it "fails to create a Cuboid - not enough arguments" do
      expect { Cuboid.new }.to raise_error ArgumentError
    end

    it "fails to create a Cuboid - origin missing keys" do
      origin = {}
      volume = {width: 0, height: 0, length: 0}
      expect { Cuboid.new(origin, volume) }.to raise_error ArgumentError
    end

    it "fails to create a Cuboid - volume missing keys" do
      origin = {x: 0, y: 0, z: 0}
      volume = {}
      expect { Cuboid.new(origin, volume) }.to raise_error ArgumentError
    end

    it "fails to create a Cuboid - origin key is negative" do
      origin = {x: 0, y: 0, z: -1}
      volume = {width: 0, height: 0, length: 0}
      expect { Cuboid.new(origin, volume) }.to raise_error ArgumentError
    end

    it "fails to create a Cuboid - origin key is a float" do
      origin = {x: 0, y: 0, z: 1.1}
      volume = {width: 0, height: 0, length: 0}
      expect { Cuboid.new(origin, volume) }.to raise_error ArgumentError
    end
  end

end
