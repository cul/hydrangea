require "hydra"

class StaticImageAggregator < CoreObject
  include ActiveFedora::SemanticNode

  include Cul::Aggregator

  include Cul::Image
  
  
  def to_solr(solr_doc=Hash.new,opts={})
    super(solr_doc, opts)
    solr_doc
  end
end
