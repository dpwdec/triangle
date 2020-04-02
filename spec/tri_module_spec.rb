require 'tri_module'

describe Tri do
  
  it "has constant 5" do
    expect(Tri::CON).to eq(5)
  end
  
  it "returns 5" do
    expect(someMethod).to eq(5)
  end
  
  context "calculating area" do
    it "calculates the are of triangle (0, 0), (0, 1), (1, 0)" do
      expect(Tri.area([0.0, 0.0], [0.0, 1.0], [1.0, 0.0])).to eq(0.5)
    end
  end
end