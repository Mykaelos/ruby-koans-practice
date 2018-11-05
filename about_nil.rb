require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutNil < Neo::Koan
  def test_nil_is_an_object
    assert_equal true, nil.is_a?(Object), "Unlike NULL in other languages"
  end

  def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
    # What happens when you call a method that doesn't exist.  The
    # following begin/rescue/end code block captures the exception and
    # makes some assertions about it.
    begin
      nil.some_method_nil_doesnt_know_about
    rescue Exception => ex
      # What exception has been caught?
      assert_equal NoMethodError, ex.class    #MYKAELOS: They clearly overwrote __ to be "FILL ME IN", which is interesting, and explains why I can't find __ online. It's custom to this project.

      # What message was attached to the exception?
      # (HINT: replace __ with part of the error message.)
      assert_match(/undefined method `some_method_nil_doesnt_know_about' for nil:NilClass/, ex.message)
    end
  end

  def test_nil_has_a_few_methods_defined_on_it
    assert_equal true, nil.nil?             #MYKAELOS: I kinda like this syntax. Easier than (thingy == null) and more explicit than the "exists" check in JS: if (thingy)
    assert_equal "", nil.to_s               #MYKAELOS: Zero surprise it's empty string
    assert_equal "nil", nil.inspect         #MYKAELOS: Interesting method...

    # THINK ABOUT IT:
    #
    # Is it better to use
    #    obj.nil?                           #MYKAELOS: I think I prefer .nil?, easier to read, and probably handles any dark magic to 100% confirm it's a nil value.
    # or
    #    obj == nil
    # Why?
  end

end
