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
    pac = Tri.area(v, @points[:a], @points[:c])
    pba = Tri.area(v, @points[:b], @points[:a])
    pcb = Tri.area(v, @points[:c], @points[:b])
    
    if @area == (pac + pba + pcb)
      return true
    else
      return false
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