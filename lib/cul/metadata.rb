require "hydra"
require "json"

module Cul
module Metadata
  include ActiveFedora::SemanticNode

  def describes
    descripta = []
    outbound_relationships.each_pair do |predicate, objec|
      descripta.concat(object)
    end
    descripta
  end

  def Metadata.included(mod)
    if mod.include? ActiveFedora::SemanticNode
      mod.has_relationship "describes", :metadata_for
    end
  end
end
end
