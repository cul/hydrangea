require "hydra"

module Cul
module Aggregator
  include ActiveFedora::SemanticNode
  def has_members?
  end

  def members
    results = []
    inbound_relationships(:objects).each_pair do |predicate, objects|
      if predicate == "http://purl.oclc.org/NET/CUL/memberOf"
        results.concat(objects)
      end
    end
    results
  end

  def size
    result = 0
    inbound_relationships(:objects).each_pair do |predicate, objects|
      if predicate == "http://purl.oclc.org/NET/CUL/memberOf"
        result+= objects.length
      end
    end
    result
  end
  def Aggregator.included(mod)
    if mod.include? ActiveFedora::SemanticNode
      mod.has_relationship "parts", :member_of, :inbound => true
    end
  end
end
end
