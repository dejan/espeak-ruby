require File.dirname(__FILE__) + '/spec_helper.rb'

describe Hash do
  before :each do
    @hash = {"a" => 1, "b" => 2, :c => "3"}
  end

  describe "symbolize_keys" do
    it "should not alter instance" do
      lambda {
        @hash.symbolize_keys
      }.should_not change { @hash.inspect }
    end
    
    it "should return hash with same values as itself contains, but with keys as symbols" do
      @hash.symbolize_keys.should == {:a => 1, :b => 2, :c => "3"}
    end
  end
  
  describe "symbolize_keys!" do
    it "should alter instance such that all keys are symbols, and" do
      @hash.symbolize_keys!
      @hash.should == {:a => 1, :b => 2, :c => "3"}
    end
  end
end