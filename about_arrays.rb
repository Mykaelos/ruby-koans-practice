require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, 2], array

    array << 333
    assert_equal [1, 2, 333], array
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]  #MYKAELOS: I'm not sure what the :syntax is, maybe an object?

    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    assert_equal :jelly, array[-1]
    assert_equal :butter, array[-3]
    assert_equal nil, array[100]
    assert_equal nil, array[-100]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut], array[0,1]  #MYKAELOS: Ok, [starting spot, count]. Easy enough syntax.
    assert_equal [:peanut, :butter], array[0,2]
    assert_equal [:and, :jelly], array[2,2]
    assert_equal [:and, :jelly], array[2,20]  #MYKAELOS: Cool, just stops at the end of the array, and doesn't loop.
    assert_equal [], array[4,0]
    assert_equal [], array[4,100]
    assert_equal nil, array[5,0] #MYKAELOS: So why is this nil, and the [4,0] == []? It's like it treats array.length in a special way.
  end

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class
    assert_not_equal [1, 2, 3, 4, 5], (1..5)
    assert_equal [1, 2, 3, 4, 5], (1..5).to_a #MYKAELOS: So .. is inclusive.
    assert_equal [1, 2, 3, 4], (1...5).to_a   #MYKAELOS: And ... is exclusive of the maximum.
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]  #MYKAELOS: I bet :thingys are static objects or consts. Or maybe enums.

    assert_equal [:peanut, :butter, :and], array[0..2]
    assert_equal [:peanut], array[0..0]
    assert_equal [:peanut, :butter, :and, :jelly], array[0..-1]
    assert_equal [:butter], array[1..1]
    assert_equal [:butter, :and], array[1..2]
    assert_equal [:peanut, :butter], array[0...2]
    assert_equal [:and, :jelly], array[2..-1]   #MYKAELOS: Ok, no idea here. EDIT: ok, so ranges are based on index points, and not count. As in, 2..-1 is start at slot 2 and include everything to slot -1 (AKA last slot because of wrap)
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    assert_equal [1, 2, :last], array

    popped_value = array.pop
    assert_equal :last, popped_value
    assert_equal [1, 2], array
  end

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first)

    assert_equal [:first, 1, 2], array

    shifted_value = array.shift
    assert_equal :first, shifted_value
    assert_equal [1, 2], array
  end

end
