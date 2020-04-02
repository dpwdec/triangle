require 'bigdecimal/util'
require 'matrix'
require 'vector2d'

module Tri
  
  SIDES = 3
  INT_ANG = 180
  
  # calculates area of arbitrary triangle using:
  # (ax(by - cy) + bx(cy - ay) + cx(ay - by)) / 2
  def self.area(p1, p2, p3)
    (((p1.x*(p2.y-p3.y)) + (p2.x*(p3.y-p1.y)) + (p3.x*(p1.y-p2.y)))/2).abs
    #(((p1[0]*(p2[1]-p3[1])) + (p2[0]*(p3[1]-p1[1])) + (p3[0]*(p1[1]-p2[1])))/2).abs
  end
  
  # calculates length of side using:
  # a^2 + b^2 = c^2
  def self.side(p1, p2)
    Math.sqrt(((p2[0] - p1[0]) ** 2) + ((p2[1] - p1[1]) ** 2)).to_d.truncate(2).to_f
  end
  
end

def testVector
  v = Vector2d(0, 0)
  v.x
end