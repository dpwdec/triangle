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
    abx = @points[1][0]-@points[0][0]
    aby = @points[1][1]-@points[0][0]
    
    side_ab = Math.sqrt((@points[1][0]-@points[0][0])**2) + ((@points[1][1]-@points[0][1])**2)
    #side b --> c
    side_bc = Math.sqrt((@points[2][0]-@points[1][0])**2) + ((@points[2][1]-@points[1][1])**2)
    #side c --> a
    side_ca = Math.sqrt((@points[0][0]-@points[2][0])**2) + ((@points[0][1]-@points[2][1])**2)
    [side_ab, side_bc, side_ca]
  end
  
  #calculate distance between two points
  def calculate_side(p1, p2)
    Math.sqrt(((p2[0] - p1[0]) ** 2) + ((p2[1] - p1[1]) ** 2)).to_d.truncate(2).to_f
  end
end