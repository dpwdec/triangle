require 'tri_module'

describe Tri do
  
  context "triangle information" do
    it "knows that a triangle has 3 sides" do
      expect(Tri::SIDES).to eq(3)
    end
    it "knows that the internal angle of a triangle are 180" do
      expect(Tri::INT_ANG).to eq(180)
    end
  end
  
  context "calculating area" do
    it "calculates the are of triangle (0, 0), (0, 1), (1, 0)" do
      expect(Tri.area(Vector2d(0.0, 0.0), Vector2d(0.0, 1.0), Vector2d(1.0, 0.0))).to eq(0.5)
    end
    it "calculates the area of triangle (15, 15), (23, 30), (50, 25)" do
      expect(Tri.area(Vector2d(15.0, 15.0), Vector2d(23.0, 30.0), Vector2d(50.0, 25.0))).to eq(222.5)
    end
    it "calculates the area of triangle (5, 2), (8, 8), (13, 4)" do
      expect(Tri.area(Vector2d(5.0, 2.0), Vector2d(8.0, 8.0), Vector2d(13.0, 4.0))).to eq(21.0)
    end
  end
  
  context "calculates side of a triangle" do
    it "calculates the distances between (0,0) and (1,1) as 1.41" do
      expect(Tri.side([0,0],[1,1])).to eq(1.41)
    end
    it "calculates the distance between (5,5) and (6,7) as 2.23" do
      expect(Tri.side([5,5],[6,7])).to eq(2.23)
    end
    it "calculates the distance between (10.4, 9.1) and (3.1, 6.9) as 7.62" do
      expect(Tri.side([10.4,9.1],[3.1,6.9])).to eq(7.62)
    end
  end
  
  it "tests vector" do
    expect(testVector).to eq(0)
  end
end