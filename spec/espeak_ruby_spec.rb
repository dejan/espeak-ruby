require File.dirname(__FILE__) + '/spec_helper.rb'

describe ESpeak do 
  
  before :each do
    @obj = Object.new
    @obj.class_eval { include ESpeak }
  end


  describe "espeak" do
    before :each do
      @obj.stub!(:prepare_options)
    end

    it "should return nil if successfull" do
      @obj.should_receive(:execute_system_command).and_return true
      @obj.espeak("whatever", {}).should == nil
    end

    it "should raise if not successfull" do
      @obj.should_receive(:execute_system_command).and_return false
      lambda {
        @obj.espeak("whatever", {})
      }.should raise_error
    end
  end


  describe "prepare_options" do
    before :each do
      @options = {:text => "Hello", 'speed' => 100}
      @obj.stub!(:execute_system_command).and_return true
    end

    it "should symbolize keys" do
      @obj.espeak("whatever", @options)
      @options.should == @options.symbolize_keys
    end

    it "should raise if no value for :text key is provided" do
      @options.delete(:text)
      lambda {
        @obj.espeak("whatever", @options)
      }.should raise_error
    end

    it "should sanatize text" do
      @obj.should_receive(:sanitize_text!).with(@options[:text])
      @obj.espeak("whatever", @options)
    end

    it "should merge default_options with provided options" do
      @default_options = {}
      @obj.should_receive(:default_espeak_options).and_return(@default_options)
      @default_options.should_receive(:merge).with(@options)
      @obj.espeak("whatever", @options)
    end
  end

end
