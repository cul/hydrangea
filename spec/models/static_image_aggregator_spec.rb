require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require "active_fedora"

describe StaticImageAggregator do
  
  before(:each) do
    Fedora::Repository.stubs(:instance).returns(stub_everything())
    @hydra_content = StaticImageAggregator.new
    @resource = Resource.new
    @hydra_content.stubs(:parts).returns([@resource])
  end

  it "Should be a kind of ActiveFedora::Base and a kind of CoreObject and a kind of Aggregator" do
    @hydra_content.should be_kind_of(ActiveFedora::Base)
    @hydra_content.should be_kind_of(CoreObject)
    @hydra_content.should be_kind_of(Cul::Aggregator)
  end
  
  it "should include Hydra Model Methods" do
    @hydra_content.class.included_modules.should include(Hydra::ModelMethods)
    @hydra_content.should respond_to(:apply_depositor_metadata)
  end
  
  it "should have accessors for its descriptions and constituent parts" do
    @hydra_content.should respond_to(:has_members?)
    @hydra_content.should respond_to(:has_descriptions?)
    @hydra_content.should respond_to(:members)
    @hydra_content.should respond_to(:descriptions)
  end
  
end
