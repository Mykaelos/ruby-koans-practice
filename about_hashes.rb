require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutHashes < Neo::Koan
  def test_creating_hashes
    empty_hash = Hash.new
    assert_equal Hash, empty_hash.class
    assert_equal({}, empty_hash)
    assert_equal 0, empty_hash.size
  end

  def test_hash_literals
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.size
  end

  def test_accessing_hashes
    hash = { :one => "uno", :two => "dos" }
    assert_equal "uno", hash[:one]
    assert_equal "dos", hash[:two]
    assert_equal nil, hash[:doesnt_exist]
  end

  def test_accessing_hashes_with_fetch
    hash = { :one => "uno" }
    assert_equal "uno", hash.fetch(:one)
    assert_raise(KeyError) do
      hash.fetch(:doesnt_exist)
    end

    # THINK ABOUT IT:
    #
    # Why might you want to use #fetch instead of #[] when accessing hash keys?  #MYKAELOS: To be able to use errors to control flow, or send errors up the call stack. Avoids doing a nil check.
  end

  def test_changing_hashes
    hash = { :one => "uno", :two => "dos" }
    hash[:one] = "eins"

    expected = { :one => "eins", :two => "dos" }
    assert_equal expected, hash
    assert_equal({ :one => "eins", :two => "dos" }, hash)

    # Bonus Question: Why was "expected" broken out into a variable
    # rather than used as a literal?                                 #MYKAELOS: because it breaks the call for some reason. I noticed the () above in one of the asserts. Not sure what's happening here.
  end

  def test_hash_is_unordered
    hash1 = { :one => "uno", :two => "dos" }
    hash2 = { :two => "dos", :one => "uno" }

    assert_equal true, hash1 == hash2
  end

  def test_hash_keys
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.keys.size
    assert_equal true, hash.keys.include?(:one)
    assert_equal true, hash.keys.include?(:two)
    assert_equal Array, hash.keys.class             #MYKAELOS: Array??? Oh, wait that makes sense if .keys and .values are just getters for an array of all of the keys or values. Similar to Java.
  end

  def test_hash_values
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.values.size
    assert_equal true, hash.values.include?("uno")
    assert_equal true, hash.values.include?("dos")
    assert_equal Array, hash.values.class
  end

  def test_combining_hashes
    hash = { "jim" => 53, "amy" => 20, "dan" => 23 }
    new_hash = hash.merge({ "jim" => 54, "jenny" => 26 })

    assert_equal true, hash != new_hash

    expected = { "jim" => 54, "amy" => 20, "dan" => 23, "jenny" => 26 } #MYKAELOS: Same keys overwrite previous, as expected.
    assert_equal true, expected == new_hash
  end

  def test_default_value
    hash1 = Hash.new
    hash1[:one] = 1

    assert_equal 1, hash1[:one]
    assert_equal nil, hash1[:two]

    hash2 = Hash.new("dos")
    hash2[:one] = 1

    assert_equal 1, hash2[:one]
    assert_equal "dos", hash2[:two]
  end

  def test_default_value_is_the_same_object
    hash = Hash.new([])

    hash[:one] << "uno" #MYKAELOS: Not actually setting the :one object here. What's happening is that the default object is getting "uno" appended to it. Ruby, you went too far here.
                        #MYKAELOS: This is a trap because it looks like the :one value is being adjusted, but it's really the default value. There's no way this hasn't caused bugs before.
    hash[:two] << "dos"

    assert_equal ["uno", "dos"], hash[:one]
    assert_equal ["uno", "dos"], hash[:two]
    assert_equal ["uno", "dos"], hash[:three]

    assert_equal true, hash[:one].object_id == hash[:two].object_id
  end

  def test_default_value_with_block
    hash = Hash.new { |hash, key| hash[key] = [] } #MYKAELOS: What in Gods name is even going on here?

    hash[:one] << "uno"
    hash[:two] << "dos"

    assert_equal ["uno"], hash[:one]  #MYKAELOS: Ah, so the block creates a new array for each append, so they're all different, which is how I expected the previous test to work. I guess this is how you can use arrays as a default, without them being the same object.
    assert_equal ["dos"], hash[:two]  #MYKAELOS: And I guess this is also the way to always make sure the isn't the same object for each slot.
    assert_equal [], hash[:three]
  end
end
