require 'bigdecimal/util'
require 'matrix'

class Triangle
  def initialize(a=[0.0, 0.0], b=[1.0, 0.0], c=[0.5, 0.0])
    @points = Array.new
    @points.push(a).push(b).push(c)
  end
  
  def points
    @points
  end
  
  def side_lengths
    #side a --> b
    side_ab = calculate_side(@points[0], @points[1])
    #side b --> c
    side_bc = calculate_side(@points[1], @points[2])
    #side c --> a
    side_ca = calculate_side(@points[2], @points[0])
    [side_ab, side_bc, side_ca]
  end
  
  def tri_angles
    #angle a --> b --> c
    angle_abc = angle_between_points(@points[1], @points[0], @points[2])
    #angle b --> c --> a
    angle_bca = angle_between_points(@points[2], @points[1], @points[0])
    #angle c --> a --> b
    angle_cab = angle_between_points(@points[0], @points[2], @points[1])
    [angle_abc, angle_bca, angle_cab]
  end
  
  def tri_area
    area_of_triangle(@points[0], @points[1], @points[2])
  end
  
  def area_of_triangle(p1, p2, p3)
    a1 = p1[0]*(p2[1]-p3[1])
    a2 = p2[0]*(p3[1]-p1[1])
    a3 = p3[0]*(p1[1]-p2[1])
    area = (a1 + a2 + a3)/2
    area.abs
  end

end