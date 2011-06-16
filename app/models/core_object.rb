require "hydra"

class CoreObject < ActiveFedora::Base

  include Hydra::ModelMethods
  has_relationship "descriptions", :metadata_for, :inbound => true


  def initialize(attrs={})
  CoreObject.has_metadata :name => "ModsMetadata", :type=> Cul::InboundModsMetadataDatastream do |ds|
    ds.load_for(self.pid, CoreObject.predicate_lookup(:metadata_for))
  end
    super(attrs)
    @descriptions = {}
    inbound_relationships(:objects).each_pair do |predicate, objects|
      objects.each do |obj|
        if predicate == CoreObject.predicate_lookup(:metadata_for)
          self.description_attach(obj)
        end
      end
    end
  end

  def to_solr(solr_doc=Hash.new,opts={})
    super(solr_doc, opts)
    solr_doc
  end

  def descriptions_append(obj)
    unless obj.kind_of? ActiveFedora::Base
      begin
        obj = ActiveFedora::Base.load_instance(obj)
      rescue ActiveFedora::ObjectNotFoundError
        "You must provide either an ActiveFedora object or a valid pid to attach it as a metadata description.  You submitted #{obj.inspect}"
        return
      end
    end
    obj.add_relationship(:metadata_for, self)
    descriptions[obj.pid] = obj
  end
  def descriptions_remove(obj)
    # SemanticNode.remove_relationship ?
  end
end
