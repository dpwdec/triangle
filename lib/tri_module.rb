module Tri
  
  SIDES = 3
  
  def self.area(p1, p2, p3)
    (((p1[0]*(p2[1]-p3[1])) + (p2[0]*(p3[1]-p1[1])) + (p3[0]*(p1[1]-p2[1])))/2).abs
  end
end