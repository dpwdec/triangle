require 'triangle.rb'
require 'bigdecimal/util'

describe Triangle do
  
  context "Default Triangle (0, 0), (1, 0), (0.5, 1)" do
    let(:tri) { Triangle.new() }
    
    it "has points Hash" do
      expect(tri.points).to be_a_kind_of(Hash)
    end
    
    it "has a sides Hash" do
      expect(tri.sides).to be_a_kind_of(Hash)
    end
    
    it "has an angles Hash" do
      expect(tri.angles).to be_a_kind_of(Hash)
    end
    
    it "has a list of sides" do
      expect(tri.sides.values
      .map{|num| num.to_d.truncate(2).to_f })
      .to contain_exactly(1.11, 1.11, 1)
    end
    
    it "has a list of angles" do
      expect(tri.angles.values
      .map{|num| num.to_d.truncate(2).to_f })
      .to contain_exactly(63.43, 63.43, 53.13)
    end
    
    it "has a angle that matches side abc" do
      expect(tri.angles[:abc].to_d.truncate(2).to_f).to eq(63.43)
    end
    it "has angle that matches side bca" do
      expect(tri.angles[:bca].to_d.truncate(2).to_f).to eq(53.13)
    end
    it "has angle that matches side cab" do
      expect(tri.angles[:cab].to_d.truncate(2).to_f).to eq(63.43)
    end
    
    it "has an area of 0.5" do
      expect(tri.area).to eq(0.5)
    end
    
    it "has a perimeter of 3.23" do
      expect(tri.perimeter.to_d.truncate(2).to_f).to eq(3.23)
    end
    
    it "says that point (0.2, 0.4) lies within it" do
      expect(tri.contains(Vector2d(0.2, 0.4))).to be true
    end
    
    it "says that point (20.0, 17.0) DOES NOT lie within it" do
      expect(tri.contains(Vector2d(20.0, 17.9))).to be false
    end
    
    it "calculates the barycentric coordinates for (0.4, 0.5) to be equal 0.35, 0.15, 0.5" do
      expect(tri.barycentric(Vector2d(0.4, 0.5))).to contain_exactly(0.35, 0.15, 0.5)
    end
    
    it "returns nil for barycentric if point is not inside triangle" do
      expect(tri.barycentric(Vector2d(10, 10))).to be nil
    end
    
  end
  
  context "Triangle (10, 5), (9, 15), (3, 2)" do
    let(:tri) { Triangle.new(Vector2d(10, 5), Vector2d(9, 15), Vector2d(3, 2)) }
    
    it "has points Hash" do
      expect(tri.points).to be_a_kind_of(Hash)
    end
    
    it "has a sides Hash" do
      expect(tri.sides).to be_a_kind_of(Hash)
    end
    
    it "has an angles Hash" do
      expect(tri.angles).to be_a_kind_of(Hash)
    end
    
    it "has a list of sides" do
      expect(tri.sides.values
      .map{|num| num.to_d.truncate(2).to_f })
      .to contain_exactly(14.31, 7.61, 10.04)
    end
    
    it "has a list of angles" do
      expect(tri.angles.values
      .map{|num| num.to_d.truncate(2).to_f })
      .to contain_exactly(107.48, 30.48, 42.02)
    end
    
    it "has a angle that matches side abc" do
      expect(tri.angles[:abc].to_d.truncate(2).to_f).to eq(30.48)
    end
    it "has angle that matches side bca" do
      expect(tri.angles[:bca].to_d.truncate(2).to_f).to eq(42.02)
    end
    it "has angle that matches side cab" do
      expect(tri.angles[:cab].to_d.truncate(2).to_f).to eq(107.48)
    end
    
    it "has an area of 36.5" do
      expect(tri.area).to eq(36.5)
    end
    
    it "has a perimeter of 31.98" do
      expect(tri.perimeter.to_d.truncate(2).to_f).to eq(31.98)
    end
    
    it "says point (0, 20) does not lie within it" do
      expect(tri.contains(Vector2d(0, 20))).to be false
    end
    
    it "says point (8, 8) does lie within it" do
      expect(tri.contains(Vector2d(8, 8))).to be true
    end
    
    it "calculates the barycentric coordinates for (8.5, 11) to be equal 0.24, 0.64, 0.12" do
      expect(tri.barycentric(Vector2d(8.5, 11.0))).to contain_exactly(0.24, 0.64, 0.12)
    end
    
    it "returns nil for barycentric if point is not inside triangle" do
      expect(tri.barycentric(Vector2d(6, 11))).to be nil
    end
    
  end
end