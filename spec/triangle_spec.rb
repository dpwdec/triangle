require 'triangle.rb'

describe Triangle do
  
  describe "calculates the area of a triangle given its coordinate points" do
    it "calculates the are of triangle (0, 0), (0, 1), (1, 0)" do
      expect(subject.area_of_triangle([0.0, 0.0], [0.0, 1.0], [1.0, 0.0])).to eq(0.5)
    end
    it "calculates the area of triangle (15, 15), (23, 30), (50, 25)" do
      expect(subject.area_of_triangle([15.0, 15.0], [23.0, 30.0], [50.0, 25.0])).to eq(222.5)
    end
    it "calculates the area of triangle (5, 2), (8, 8), (13, 4)" do
      expect(subject.area_of_triangle([5.0, 2.0], [8.0, 8.0], [13.0, 4.0])).to eq(21.0)
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
end