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
  end
  
  # calculates length of side using:
  # a^2 + b^2 = c^2
  def self.side(p1, p2)
    Math.sqrt(((p2.x - p1.x) ** 2) + ((p2.y - p1.y) ** 2)).to_d.truncate(2).to_f
  end
  
  # calculate vector between two points using:
  # x = bx - ax, y = by - ay
  def self.distance(p1, p2)
    Vector2d((p2.x - p1.x), (p2.y - p1.y))
  end
  
end