require 'triangle.rb'

describe Triangle do
  context "isosceles triangle" do
    let(:tri) { Triangle.new([0,0],[1,0],[0.5,1]) }
    it "returns a list of sides" do
      expect(tri.side_lengths).to contain_exactly(1.118, 1.118, 1)
    end
  end
end