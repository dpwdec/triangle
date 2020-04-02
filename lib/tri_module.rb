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
    magnitude(distance(p1, p2), 5).to_d.truncate(2).to_f
  end
  
  # calculate the magnitude of a vector using:
  # vx^2 + vy^2 = magnitude^2
  def self.magnitude(v, dp=2)
    Math.sqrt((v.x ** 2) + (v.y ** 2)).to_d.truncate(dp).to_f
  end
  
  # calculate vector between two points using:
  # x = bx - ax, y = by - ay
  def self.distance(p1, p2)
    Vector2d((p2.x - p1.x), (p2.y - p1.y))
  end
  
  #calculate angle between points A --> B --> C
  def self.angle(p1, p2, p3)

  end
  
  # calculate angle between two vectors
  def self.vangle(v1, v2, dp=2)
    #dot_prod = v1.dot_product(v2)
    rtd(Math.acos(v1.dot_product(v2)/(magnitude(v1, 100) * magnitude(v2, 100))), dp)
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