require 'triangle.rb'

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