# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # WRITE THIS CODE
  return :equilateral if a == b && b == c
  return :isosceles if  a == b || b == c || c == a
  return :scalene

  # Alternate method provided by Cad
  # return :equilateral if [a,b,c].uniq.length == 1
  # return :isosceles if [a,b,c].uniq.length == 2
  # return :scalene

  # MYKAELOS: I prefer the more explicit equal checks above, instead of using
  # [].uniq, but uniq is much better when you start getting a lot of objects to
  # check, like 4+ of them.
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
