require 'tri_module'

describe Tri do
  
  context "triangle information" do
    it "knows that a triangle has 3 sides" do
      expect(Tri::SIDES).to eq(3)
    end
  end
  
  context "calculating area" do
    it "calculates the are of triangle (0, 0), (0, 1), (1, 0)" do
      expect(Tri.area([0.0, 0.0], [0.0, 1.0], [1.0, 0.0])).to eq(0.5)
    end
    it "calculates the area of triangle (15, 15), (23, 30), (50, 25)" do
      expect(Tri.area([15.0, 15.0], [23.0, 30.0], [50.0, 25.0])).to eq(222.5)
    end
    it "calculates the area of triangle (5, 2), (8, 8), (13, 4)" do
      expect(Tri.area([5.0, 2.0], [8.0, 8.0], [13.0, 4.0])).to eq(21.0)
    end
  end
end