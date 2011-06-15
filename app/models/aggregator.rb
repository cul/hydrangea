require "hydra"

class Aggregator < CoreObject
  
  has_relationship "parts", :member_of, :inbound => true
  
  def to_solr(solr_doc=Hash.new,opts={})
    super(solr_doc, opts)
    solr_doc
  end
end
