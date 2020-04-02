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
    it "returns a vector" do
      expect(subject.vector_between_points([0, 0], [1, 1])).to be_a_kind_of(Vector)
    end
    
    it "calculates vector between (1, 0) and (0.5, 1) as (-0.5, 1)" do
      expect(subject.vector_between_points([1, 0], [0.5, 1])).to eq(Vector[-0.5, 1.0])
    end
    it "calculates vector between (10, 12) and (22, 3) as (12, -9)" do
      expect(subject.vector_between_points([10, 12], [22, 3])).to eq(Vector[12.0, -9.0])
    end
  end
  
  describe "converts radians to degrees to 1 decimal place" do
    it "converts 1 to 57.2" do
      expect(subject.radians_to_degrees(1.0)).to eq(57.2)
    end
    it "converts 0.7893 to 45.2" do
      expect(subject.radians_to_degrees(0.7893)).to eq(45.2)
    end
    it "converts 0.04 to 2.2" do
      expect(subject.radians_to_degrees(0.04)).to eq(2.2)
    end
  end
  
  describe "calculating the angle between two vectors" do
    it "calculates (1, 1), (0, 0) and (1, 0) as 45.0" do
      expect(subject.angle_between_vectors(Vector[1.0, 1.0], Vector[1.0, 0.0])).to eq(45.0)
    end
    it "calculates angle between (10, 15) and (3, 7) as 10.4" do
      expect(subject.angle_between_vectors(Vector[10.0, 15.0], Vector[3.0, 7.0])).to eq(10.4)
    end
  end
  
  describe "calculating the angle betweeen three points" do
    it "calculates angle between (0, 0), (1, 0), (0.5, 1) to be 63.4" do
      expect(subject.angle_between_points([0.0, 0.0], [1.0, 0.0], [0.5, 1.0])).to eq(63.4)
    end
    it "calculates angle between (10, 5), (2, 3), (0, 0) to be 137.7" do
      expect(subject.angle_between_points([2.0, 3.0], [10.0, 5.0], [0.0, 0.0])).to eq(137.7)
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
  end
  
  context "right angle triangle" do
    let(:tri) { Triangle.new([0.0,0.0],[0.0,1.0],[1.0,0.0]) }
    it "returns a list of sides" do
      expect(tri.side_lengths).to contain_exactly(1.41, 1, 1)
    end
    it "returns a list of angles" do
      expect(tri.tri_angles).to contain_exactly(45.0, 45.0, 90.0)
    end
  end
end