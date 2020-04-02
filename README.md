# Triangle RSpec

## Dependencies 

This code requires the [vector2d][vlink] gem to work.

[vlink]: https://github.com/elektronaut/vector2d "Vector 2d library"

## Spec

Test project with RSpec to build a `Triangle` class and a `Tri` module.

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

## Initial Spec

> Test project with RSpec to build a triangle class that can:
> + store coordinate information A, B, C about the triangle
> + calculate the distance between two points
> + calculate a vector between two points
> + calculate an angle between two vectors
> + calculate an angle between three points
> + convert radians to degrees
> + calculate the sides of a triangle
> + calculate the angles of the triangle
> + calculate the area of the triangle

## Structure

```
triangle.rb
```