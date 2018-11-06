require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutObjects < Neo::Koan
  def test_everything_is_an_object              #MYKAELOS: So is .is_a?(Object) even useful?
    assert_equal true, 1.is_a?(Object)
    assert_equal true, 1.5.is_a?(Object)
    assert_equal true, "string".is_a?(Object)
    assert_equal true, nil.is_a?(Object)
    assert_equal true, Object.is_a?(Object)
  end

  def test_objects_can_be_converted_to_strings
    assert_equal "123", 123.to_s
    assert_equal "", nil.to_s
  end

  def test_objects_can_be_inspected            #MYKAELOS: Looks like .inspect is kind of a toString, but for the object's name?
    assert_equal "123", 123.inspect
    assert_equal "nil", nil.inspect
  end

  def test_every_object_has_an_id
    obj = Object.new
    assert_equal Integer, obj.object_id.class
    # assert_equal 25556220, obj.object_id    #MYKAELOS: Ha, can't do this because the int changes every time. Makes sense.
  end

  def test_every_object_has_different_id
    obj = Object.new
    another_obj = Object.new
    assert_equal true, obj.object_id != another_obj.object_id
    assert_not_equal obj.object_id, another_obj.object_id       #MYKAELOS: I guessed that assert_not_equal existed, and works as expected. EDIT: Turns out I was mistaken. assert_equal and assert_not_equal exist in Ruby, but in this context, they're custom to this project.
  end

  def test_small_integers_have_fixed_ids
    assert_equal 1, 0.object_id
    assert_equal 3, 1.object_id
    assert_equal 5, 2.object_id
    assert_equal 201, 100.object_id

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?   MYKAELOS: x*2+1, but why skip a number? The +1 isn't surprizing I guess, because id 0 is probably reserved or something, or nothing.
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone

    assert_equal true, obj           != copy
    assert_equal true, obj.object_id != copy.object_id
  end
end
