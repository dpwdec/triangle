require 'vector2d'
require 'tri_module'

class Triangle
  
  include Tri
  
  def initialize(a=Vector2d(0, 0), b=Vector2d(1, 0), c=Vector2d(0.5, 1))
    @points = {a: a, b: b, c: c}
    sides = Tri.sides(@points[:a], @points[:b], @points[:c])
    @sides = { ab: sides[0], bc: sides[1], ca: sides[2] }
    @angles = Hash[
      abc: Tri.angle(@points[:a], @points[:b], @points[:c]),
      bca: Tri.angle(@points[:b], @points[:c], @points[:a]),
      cab: Tri.angle(@points[:c], @points[:a], @points[:b]),
    ]
    @area = Tri.area(@points[:a], @points[:b], @points[:c])
    @perimeter = Tri.perimeter(@points[:a], @points[:b], @points[:c])
  end
  
  # calculate if a point lies within this triangle using
  # size of PAB + PAC + PBC equals area
  def contains(v)
    if @area == (Tri.area(v, @points[:a], @points[:c]) + 
      Tri.area(v, @points[:b], @points[:a]) + 
      Tri.area(v, @points[:c], @points[:b]))
      return true
    else
      return false
    end
  end
  
  # returns the barycentric coordinate of a point on the triangle
  def barycentric(v)
    if contains(v)
      v0 = @points[:b] - @points[:a]
      v1 = @points[:c] - @points[:a]
      v2 = v - @points[:a]
      
      d00 = v0.dot_product(v0)
      d01 = v0.dot_product(v1)
      d11 = v1.dot_product(v1)
      d20 = v2.dot_product(v0)
      d21 = v2.dot_product(v1)
      
      denom = d00 * d11 - d01 * d01
      
      v = (d11 * d20 - d01 * d21) / denom
      w = (d00 * d21 - d01 * d20) / denom
      u = 1.0 - v - w
      
      [v.round(2), w.round(2), u.round(2)]
    else
      return nil
    end
  end
  
  def points
    @points
  end
  
  def sides
    @sides
  end
  
  def angles
    @angles
  end
  
  def area
    @area
  end
  
  def perimeter
    @perimeter
  end

end