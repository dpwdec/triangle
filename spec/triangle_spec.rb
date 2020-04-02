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
  end
    
=begin
    it "returns a list of points" do
      expect(tri.points).to contain_exactly([0,0],[1,0],[0.5,1])
    end
    it "returns a list of sides" do
      expect(tri.side_lengths).to contain_exactly(1.11, 1.11, 1)
    end
    it "returns a list of anlges" do
      expect(tri.tri_angles).to contain_exactly(63.4, 63.4, 53.1)
    end
    it "returns its area" do
      expect(tri.tri_area).to eq(0.5)
    end
  end
  
  context "right angle triangle" do
    let(:tri) { Triangle.new([0.0,0.0],[0.0,1.0],[1.0,0.0]) }
    it "returns a list of sides" do
      expect(tri.side_lengths).to contain_exactly(1.41, 1, 1)
    end
    it "returns a list of angles" do
      expect(tri.tri_angles).to contain_exactly(45.0, 45.0, 90.0)
    end
    it "returns its area" do
      expect(tri.tri_area).to eq(0.5)
    end
  end
=end
end