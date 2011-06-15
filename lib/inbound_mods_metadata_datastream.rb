require "active-fedora"
module Cul
class InboundModsMetadataDatastream < ActiveFedora::NokogiriDatastream
  def load_for(object_pid, predicate)
    # needs to use predicate and object_pid to find
    # enclosing object of actual datastream, and load content
  end
end
end
