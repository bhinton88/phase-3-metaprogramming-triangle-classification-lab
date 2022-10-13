class Triangle

  class TriangleError < StandardError
    def message
      "This is not a triagle!"
    end
  end

  def initialize(side_a, side_b, side_c)
   @side_a = side_a
   @side_b = side_b
   @side_c = side_c
  end

  def kind
    all_sides = [@side_a,@side_b,@side_c]

    if all_sides.any? {|value| value <= 0}
      raise TriangleError
    # if all_sides.all? {|value| value == 0 } == true
    #   raise TriangleError
    # elsif all_sides.any? {|value| value < 0} == true
    #   raise TriangleError
    elsif ((all_sides[0] + all_sides[1] > all_sides[2]) == false || (all_sides[1] + all_sides[2] > all_sides[0]) == false || (all_sides[0] + all_sides[2] > all_sides[1]) == false)
      raise TriangleError
    else
      case all_sides.uniq.size
      when 1 then :equilateral
      when 2 then :isosceles
      else        :scalene
      end
    end
  end
end


# put all the elements into an array and compare using the uniq method
# which returns an array with only unique values. Then compare the size
# basis our definitions of a triangle. 

# size would be 1 if all three values in the array are the same 

# size would be 2 if TWO values in the array are the same

# all other sizes would return scalene