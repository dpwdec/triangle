require 'bigdecimal/util'
require 'matrix'
require 'vector2d'
require 'tri_module'

class Triangle
  
  include Tri
  
  def initialize(a=Vector2d(0, 0), b=Vector2d(1, 0), c=Vector2d(0.5, 1))
    @points = {a: a, b: b, c: c}
    sides = Tri.sides(@points[:a], @points[:b], @points[:c])
    @sides = { ab: sides[0], bc: sides[1], ca: sides[2] }
    @angles = m_angles
  end
  
  # place angles of this triangle into a hash
  def m_angles
    Hash[
      abc: Tri.angle(@points[:a], @points[:b], @points[:c]),
      bca: Tri.angle(@points[:b], @points[:c], @points[:a]),
      cab: Tri.angle(@points[:c], @points[:a], @points[:b]),
    ]
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

end