require "hydra"

module Cul
module Fedora
module Core
class Aggregator < Cul::Fedora::Core::CoreObject
  
  include Hydra::ModelMethods
  
  has_relationship "parts", :member_of, :inbound => true
  
  def to_solr(solr_doc=Hash.new,opts={})
    super(solr_doc, opts)
    solr_doc
  end
end
end
end
end
