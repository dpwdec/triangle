require 'bigdecimal/util'

class Triangle
  def initialize(a=[0.0,0.0], b=[1.0,0.0], c=[0.5,0.0])
    @points = Array.new
    @points.push(a).push(b).push(c)
  end
  
  def points
    @points
  end
  
  # calculates lengths using a^2 + b^2 = c^2
  def side_lengths
    #side a --> b
    side_ab = calculate_side(@points[0], @points[1])
    #side b --> c
    side_bc = calculate_side(@points[1], @points[2])
    #side c --> a
    side_ca = calculate_side(@points[2], @points[0])
    [side_ab, side_bc, side_ca]
  end
  
  #calculate distance between two points
  def calculate_side(p1, p2)
    Math.sqrt(((p2[0] - p1[0]) ** 2) + ((p2[1] - p1[1]) ** 2)).to_d.truncate(2).to_f
  end
end