# Triangle RSpec

Test project with RSpec to build a `Triangle` class and a `Tri` module.

## Dependencies 

This code requires the [vector2d][vlink] gem to work.

[vlink]: https://github.com/elektronaut/vector2d "Vector 2d library"

## Spec

The `Tri` module can perform triangle based calculations:
+ Utility
  + calculate the length of the side of a triangle
  + calculate the magnitude of a vector
  + calculate an xy distance vector between two points
  + calculate the angle between two vectors
  + calculate an angle at B of points A --> B --> C
+ Triangle Based
  + calculate the area of a triangle given its vertexes
  + calculate perimeter of a triangle give its vertexes
  + return a list of the lengths of the sides of a triangle given its vertexes
  + return a list of the angles of a triangle given its vertexes
+ Conversion
  + convert radians to degrees
  + convert degrees to radians

The `Triangle` class holds data about a triangle and performs triangle instance specific calculations:
+ Data
  + Store triangle instance vertex information A, B, C 
  + Store a list of triangle instance side lengths AB, BC, CA
  + Store a list of triangle instance angles ABC, BCA, CBA
  + Store triangle instance area
  + Store triangle instance perimeter
+ Calculations
  + Test if a point lies within the triangle 
  + Return barycentric coordinates for a point inside the triangle

## Structure

`triangle.rb` contains the `Triangle` class which store information about a specific instance of triangle. 
Triangles are immutable being purely functional constructs in this implementation.
This class also contains methods to check triangle specific calculations such as `contains(point)` to check if a point is inside this triangle instance,
or `barycentric(point)` which returns the barycentric coordinates of a point for this triangle instance *if* it is inside the triangle.
The `Triangle` class relies heavily on the `Tri` module to function.

`tri.rb` contains the `Tri` module which contains a suite of methods for triangle based maths and calculations.