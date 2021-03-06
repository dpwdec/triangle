require 'tri_module'
require 'bigdecimal/util'

describe Tri do
  
  context "triangle information" do
    it "knows that a triangle has 3 sides" do
      expect(Tri::SIDES).to eq(3)
    end
    it "knows that the internal angle of a triangle are 180" do
      expect(Tri::INT_ANG).to eq(180)
    end
  end
  
  describe "Utility" do
    
    context "calculates side of a triangle" do
      it "calculates the distances between (0,0) and (1,1) as 1.41" do
        expect(Tri.side(Vector2d(0,0), Vector2d(1,1)).to_d.truncate(2).to_f).to eq(1.41)
      end
      it "calculates the distance between (5,5) and (6,7) as 2.23" do
        expect(Tri.side(Vector2d(5,5), Vector2d(6,7)).to_d.truncate(2).to_f).to eq(2.23)
      end
      it "calculates the distance between (10.4, 9.1) and (3.1, 6.9) as 7.62" do
        expect(Tri.side(Vector2d(10.4,9.1), Vector2d(3.1,6.9)).to_d.truncate(2).to_f).to eq(7.62)
      end
    end
    
    context "calculates the magnitude of a vector" do
      it "calculates magnitude of vector (3, 4) as 5.0" do
        expect(Tri.magnitude(Vector2d(3, 4))).to eq(5.0)
      end
      it "calculates magnitude of vector (10, 14) as 17.204" do
        expect(Tri.magnitude(Vector2d(10.0, 14.0)).to_d.truncate(3).to_f).to eq(17.204)
      end
    end
    
    context "calculates a vector between two points" do
      it "returns a vector" do
        expect(Tri.distance(Vector2d(0, 0), Vector2d(1, 1))).to be_a_kind_of(Vector2d)
      end
      
      it "calculates vector between (1, 0) and (0.5, 1) as (-0.5, 1)" do
        expect(Tri.distance(Vector2d(1, 0), Vector2d(0.5, 1))).to eq(Vector2d(-0.5, 1.0))
      end
      it "calculates vector between (10, 12) and (22, 3) as (12, -9)" do
        expect(Tri.distance(Vector2d(10, 12), Vector2d(22, 3))).to eq(Vector2d(12.0, -9.0))
      end
    end
    
    context "calculate angle at B for points A --> B --> C" do
      it "calculates angle between (1, 0), (0, 0), (0.5, 1) as 63.4 degrees" do
        expect(Tri.angle(Vector2d(1.0, 0.0), Vector2d(0.0, 0.0), Vector2d(0.5, 1.0)).to_d.truncate(1).to_f).to eq(63.4)
      end
      it "calculates angle between (10, 5), (2, 3), (0, 0) to be 137.7" do
        expect(Tri.angle(Vector2d(10.0, 5.0), Vector2d(2.0, 3.0), Vector2d(0.0, 0.0)).to_d.truncate(1).to_f).to eq(137.7)
      end
      
    end
    
    context "calculates an angle between two vectors" do
      it "calculates (1, 1), (0, 0) and (1, 0) as 45.0" do
        expect(Tri.vangle(Vector2d(1.0, 1.0), Vector2d(1.0, 0.0)).to_d.truncate(1).to_f).to eq(45.0)
      end
      it "calculates angle between (10, 15) and (3, 7) as 10.4" do
        expect(Tri.vangle(Vector2d(10.0, 15.0), Vector2d(3.0, 7.0)).to_d.truncate(1).to_f).to eq(10.4)
      end
      it "calculates angle between (43.2, 19) and (21, 5.3) as 20.235" do
        expect(Tri.vangle(Vector2d(43.2, 19.0), Vector2d(21.0, 5.3)).to_d.truncate(4).to_f).to eq(9.576)
      end
    end
  end
  
  describe "Triangle Based" do
    
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
    
    context "calculating perimeter" do
      it "calculates the perimeter of triangle (0, 0), (1, 0), (0.5, 1)" do
       expect(Tri.perimeter(Vector2d(0, 0), Vector2d(1.0, 0.0), Vector2d(0.5, 1)).to_d.truncate(2).to_f).to eq(3.23)
      end
      
      it "calculates the perimeter of triangle (10, 5), (9, 15), (3, 2)" do
       expect(Tri.perimeter(Vector2d(10.0, 5.0), Vector2d(9.0, 15.0), Vector2d(3.0, 2.0)).to_d.truncate(2).to_f).to eq(31.98)
      end
    end
    
    context "calculates list of triangle sides given its vertexes ABC" do
      it "returns an array" do
        expect(Tri.sides(Vector2d(0,0), Vector2d(1,1), Vector2d(2,2))).to be_a_kind_of(Array)
      end
      
      it "returns a list of sides for triangle (0, 0), (1, 0), (0.5, 1)" do
        expect(Tri.sides(Vector2d(0, 0), Vector2d(1, 0), Vector2d(0.5, 1))
        .map{|num| num.to_d.truncate(2).to_f })
        .to contain_exactly(1.11, 1.11, 1)
      end
      
      it "returns a list of sides for triangle (0, 0), (0, 1), (1, 0)" do
        expect(Tri.sides(Vector2d(0, 0), Vector2d(0, 1), Vector2d(1, 0))
        .map{|num| num.to_d.truncate(2).to_f })
        .to contain_exactly(1.41, 1, 1)
      end
    end
    
    context "calculates list of angles from triangle vertexes ABC" do
      it "returns an array" do
        expect(Tri.angles(Vector2d(0,0), Vector2d(1,1), Vector2d(2,2))).to be_a_kind_of(Array)
      end
      
      it "returns a list of anlges for triangle (0, 0), (1, 0), (0.5, 1)" do
        expect(Tri.angles(Vector2d(0, 0), Vector2d(1, 0), Vector2d(0.5, 1))
        .map{|num| num.to_d.truncate(1).to_f })
        .to contain_exactly(63.4, 63.4, 53.1)
      end
      
      it "returns a list of angles for triangle (0, 0), (0, 1), (1, 0)" do
      expect(Tri.angles(Vector2d(0, 0), Vector2d(0, 1), Vector2d(1, 0))
      .map{|num| num.to_d.truncate(1).to_f })
      .to contain_exactly(45.0, 45.0, 90.0)
    end
      
    end
    
  end
  
  describe "Conversion" do
    
    context "converts radians to degrees" do
      it "converts 1 to 57.295" do
    expect(Tri.rtd(1.0).to_d.truncate(3).to_f).to eq(57.295)
      end
      it "converts 0.7893 to 45.2" do
        expect(Tri.rtd(0.7893).to_d.truncate(1).to_f).to eq(45.2)
      end
      it "converts 0.04 to 2.29" do
        expect(Tri.rtd(0.04).to_d.truncate(2).to_f).to eq(2.29)
      end
      it "converts 2.1 to 120.32" do
        expect(Tri.rtd(0.04).to_d.truncate(2).to_f).to eq(2.29)
      end
    end
    
    context "converts degrees to radians" do
      it "converts 40 to 0.69" do
        expect(Tri.dtr(40.0).to_d.truncate(2).to_f).to eq(0.69)
      end
      it "converts 120 to 2.0" do
        expect(Tri.dtr(120.0).to_d.truncate(1).to_f).to eq(2.0)
      end
    end
    
  end
  
end