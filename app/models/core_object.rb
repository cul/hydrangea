require "hydra"

module Cul
module Fedora
module Core
class CoreObject < ActiveFedora::FedoraObject
  
  include Hydra::ModelMethods
  
  has_relationship "metadata", :metadata_for, :inbound => true

  def initialize(attrs={})
    super(attrs)
    @descriptions = {}
    inbound_relationships(:objects).each_pair do |predicate, objects|
      objects.each do |obj|
        if predicate == :metadata_for
          self.description_attach(obj)
        end
      end
    end
  end
  
  def to_solr(solr_doc=Hash.new,opts={})
    super(solr_doc, opts)
    solr_doc
  end
  
  # @param [Hash] opts -- same options as auto-generated methods for relationships (ie. :response_format)
  # @return [Array of ActiveFedora objects, Array of PIDs, or Solr::Result] -- same options as auto-generated methods for relationships (ie. :response_format)
  def descriptions(opts={})
    @descriptions
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
end
end
end
