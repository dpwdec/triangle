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
    Math.sqrt((distance(p1, p2).x ** 2) + (distance(p1, p2).y ** 2)).to_d.truncate(2).to_f
  end
  
  # calculate vector between two points using:
  # x = bx - ax, y = by - ay
  def self.distance(p1, p2)
    Vector2d((p2.x - p1.x), (p2.y - p1.y))
  end
  
  #calculate angle between points A --> B --> C
  def self.angle(p1, p2, p3)
    a = side(p1, p2)
    b = side(p2, p3)
    c = side(p3, p1)
  end
  
  # calculate angle between two vectors
  def self.vangle(v1, v2)
    dot_prod = v1.dot_product(v2)
    rtd(Math.acos(dot_prod/(side(v1.x, v1.y) * side(v2.x, v2.y))))
  end
  
  # convert radians to degrees
  def self.rtd(radians, decimal_places=2)
    (radians * 180 / Math::PI).to_d.truncate(decimal_places).to_f
  end
  
  # convert degrees to radians
  def self.dtr(degrees, decimal_places=2)
    ((degrees / 180) * Math::PI).to_d.truncate(decimal_places).to_f
  end
  
end