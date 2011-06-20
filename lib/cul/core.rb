require "hydra"
require "json"

module Cul
module Core
  include ActiveFedora::SemanticNode

  def descriptions
    _json = Fedora::Repository.instance.fetch_custom(self,"methods/ldpd:sdef.Core/describedBy", :format=>'json')
    _desc = JSON.parse(_json)
    if _desc.include? 'results'
      return _desc['results'].collect do |x|
        x['description']
      end
    else
      return []
    end
  end

  def has_descriptions?
    inbound_relationships(:objects).each_pair do |predicate, objects|
      objects.each do |obj|
        if predicate == "http://purl.oclc.org/NET/CUL/metadataFor"
          return true
        end
      end
    end
    return false
  end

  def number_descriptions
    _json = Fedora::Repository.instance.fetch_custom(self,"methods/ldpd:sdef.Core/describedBy", :format=>'json')
    _desc = JSON.parse(_json)
    _result = 0
    if _desc.include? 'results'
      _result = _desc['results'].length
    end
    _result
  end
  def Core.included(mod)
    if mod.include? ActiveFedora::SemanticNode
      mod.has_relationship "descriptions", :metadata_for, :inbound => true
    end
  end
end
end
