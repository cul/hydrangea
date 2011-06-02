require "hydra"

module Cul
module Fedora
module Core
class StaticImageAggregator < Cul::Fedora::Core::Aggregator
  
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
