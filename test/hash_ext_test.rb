require File.expand_path('../test_helper', __FILE__)

class HashExtTest < Test::Unit::TestCase
  def test_symbolize_keys
    hash = {"a" => 1, "b" => 2, :c => "3"}
    new_hash = hash.symbolize_keys
    assert_equal({:a => 1, :b => 2, :c => "3"}, new_hash)
    # should not alter instance
    assert_not_same @hash, new_hash
  end
end
