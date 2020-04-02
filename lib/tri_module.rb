require 'bigdecimal/util'
require 'matrix'
require 'vector2d'

module Tri
  
  # TRIANGLE INFORMATION CONSTANTS
  SIDES = 3
  INT_ANG = 180
  
  # UTILITY METHODS
  
  # calculates length of side using:
  # a^2 + b^2 = c^2
  def self.side(p1, p2, dp=2)
    magnitude(distance(p1, p2), 5).to_d.truncate(dp).to_f
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
  
  # calculate angle between two vectors using:
  # cosϑ = a · b / |a| * |b|
  # ϑ = acos(a · b / |a| * |b|)
  def self.vangle(v1, v2, dp=2)
    rtd(Math.acos(v1.dot_product(v2)/(magnitude(v1, 100) * magnitude(v2, 100))), dp)
  end
  
  #calculate angle between points A --> B --> C
  def self.angle(p1, p2, p3, dp=2)
    vangle(distance(p1, p2), distance(p3, p2), dp)
  end
  
  # TRIANGLE BASED METHODS
  
  # calculates area of arbitrary triangle using:
  # (ax(by - cy) + bx(cy - ay) + cx(ay - by)) / 2
  def self.area(p1, p2, p3)
    (((p1.x*(p2.y-p3.y)) + (p2.x*(p3.y-p1.y)) + (p3.x*(p1.y-p2.y)))/2.0).abs
  end
  
  def self.perimeter(p1, p2, p3, dp=2)
    sides(p1, p2, p3, dp).inject(0, :+).to_d.truncate(dp).to_f
  end
  
  # returns a list of the side lengths of an arbitrary triangle
  def self.sides(p1, p2, p3, dp=2)
    [side(p1, p2, dp), side(p2, p3, dp), side(p3, p1, dp)]
  end
  
  def self.angles(p1, p2, p3, dp=2)
    [angle(p1, p2, p3, dp), angle(p2, p3, p1, dp), angle(p3, p1, p2, dp)]
  end
  
  # CONVERSION METHODS
  
  # convert radians to degrees suing:
  # r * 180 / PI
  def self.rtd(radians, decimal_places=2)
    (radians * 180 / Math::PI).to_d.truncate(decimal_places).to_f
  end
  
  # convert degrees to radians using:
  # (d / 180) * PI
  def self.dtr(degrees, decimal_places=2)
    ((degrees / 180) * Math::PI).to_d.truncate(decimal_places).to_f
  end
  
end