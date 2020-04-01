require 'triangle.rb'

describe Triangle do
  describe "calculating the distance between two points" do
    it "calculates the distances between (0,0) and (1,1) as 1.41" do
      expect(subject.calculate_side([0,0],[1,1])).to eq(1.41)
    end
    it "calculates the distance between (5,5) and (6,7) as 2.23" do
      expect(subject.calculate_side([5,5],[6,7])).to eq(2.23)
    end
  end
  
  context "isosceles triangle" do
    let(:tri) { Triangle.new([0.0,0.0],[1.0,0.0],[0.5,1.0]) }
    it "returns a list of points" do
      expect(tri.points).to contain_exactly([0,0],[1,0],[0.5,1])
    end
    
    it "returns a list of sides" do
      expect(tri.side_lengths).to contain_exactly(1.118, 1.118, 1)
    end
  end
  
  context "right angle triangle" do
    let(:tri) { Triangle.new([0,0],[0,1],[1,0]) }
    it "returns a list of sides" do
      expect(tri.side_lengths).to contain_exactly(1.414, 1, 1)
    end
  end
end