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

  describe "move_to" do
    it "changes the origin" do
      origin = {x: 1, y: 1, z: 1}
      expect(subject.move_to!(origin)).to eq({x:1, y:1, z:1})
    end

    it "fails to change origin - invalid argument" do
      origin = {x: 1, y: 1}
      expect { subject.move_to!(origin) }.to raise_error ArgumentError
    end
  end

  describe "vertices" do
    it "gets the vertices for a cuboid" do
      expect(subject.vertices).to eq([
        {:x=>3.0, :y=>3.5, :z=>4.0},
        {:x=>3.0, :y=>3.5, :z=>8.0},
        {:x=>3.0, :y=>6.5, :z=>4.0},
        {:x=>3.0, :y=>6.5, :z=>8.0},
        {:x=>5.0, :y=>3.5, :z=>4.0},
        {:x=>5.0, :y=>3.5, :z=>8.0},
        {:x=>5.0, :y=>6.5, :z=>4.0},
        {:x=>5.0, :y=>6.5, :z=>8.0}
      ])
    end
  end

end
