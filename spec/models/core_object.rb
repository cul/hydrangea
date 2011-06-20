require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require "active_fedora"

describe CoreObject do
  
  before(:each) do
    Fedora::Repository.stubs(:instance).returns(stub_everything())
    @hydra_content = CoreObject.new
  end

  it "Should be a kind of ActiveFedora::Base and Cul::Core" do
    @hydra_content.should be_kind_of(ActiveFedora::Base)
    @hydra_content.should be_kind_of(Cul::Core)
  end
  
  it "should include Hydra Model Methods" do
    @hydra_content.class.included_modules.should include(Hydra::ModelMethods)
    @hydra_content.should respond_to(:apply_depositor_metadata)
  end
  
  it "should have accessors for its descriptions" do
    @hydra_content.should respond_to(:has_descriptions?)
    @hydra_content.should respond_to(:descriptions)
  end
  
end
