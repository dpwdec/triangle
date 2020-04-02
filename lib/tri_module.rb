module Tri
  
  CON = 5
  
  def self.area(p1, p2, p3)
    a1 = p1[0]*(p2[1]-p3[1])
    a2 = p2[0]*(p3[1]-p1[1])
    a3 = p3[0]*(p1[1]-p2[1])
    area = (a1 + a2 + a3)/2
    area.abs
  end
end

def someMethod
  5
end