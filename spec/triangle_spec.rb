require 'triangle.rb'

describe Triangle do
  describe "calculating the distance between two points" do
    it "calculates the distances between (0,0) and (1,1) as 1.41" do
      expect(subject.calculate_side([0,0],[1,1])).to eq(1.41)
    end
    it "calculates the distance between (5,5) and (6,7) as 2.23" do
      expect(subject.calculate_side([5,5],[6,7])).to eq(2.23)
    end
    it "calculates the distance between (10.4, 9.1) and (3.1, 6.9) as 7.62" do
      expect(subject.calculate_side([10.4,9.1],[3.1,6.9])).to eq(7.62)
    end
  end
  
  describe "calculating the vector between two points" do
    it "calculates vector between (1, 0) and (0.5, 1) as (-0.5, 1)" do
      expect(subject.vector_between_points([1, 0], [0.5, 1])).to eq([-0.5, 1.0])
    end
    it "calculates vector between (10, 12) and (22, 3) as (12, -9)" do
      expect(subject.vector_between_points([10, 12], [22, 3])).to eq([12.0, -9.0])
    end
  end
  
  describe "calculating the angle between two points" do
    it "calculates (1, 1), (0, 0) and (1, 0) as 45.0" do
      expect(subject.angle_between_points([1, 1], [0, 0], [1, 0])).to eq(45.0)
    end
  end
  
  context "isosceles triangle" do
    let(:tri) { Triangle.new([0.0,0.0],[1.0,0.0],[0.5,1.0]) }
    it "returns a list of points" do
      expect(tri.points).to contain_exactly([0,0],[1,0],[0.5,1])
    end
    
    it "returns a list of sides" do
      expect(tri.side_lengths).to contain_exactly(1.11, 1.11, 1)
    end
  end
  
  context "right angle triangle" do
    let(:tri) { Triangle.new([0.0,0.0],[0.0,1.0],[1.0,0.0]) }
    it "returns a list of sides" do
      expect(tri.side_lengths).to contain_exactly(1.41, 1, 1)
    end
  end
end