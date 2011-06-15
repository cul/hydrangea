require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require "active_fedora"

describe Resource do
  
  before(:each) do
    Fedora::Repository.stubs(:instance).returns(stub_everything())
    @asset = Resource.new
    @asset.stubs(:create_date).returns("2008-07-02T05:09:42.015Z")
    @asset.stubs(:modified_date).returns("2008-09-29T21:21:52.892Z")
  end
  
  it "Should be a kind of ActiveFedora::Base and a kind of Resource" do
    @asset.should be_kind_of(ActiveFedora::Base)
    @asset.should be_kind_of(Resource)
  end
  
end
