require "hydra"

class Resource < CoreObject
  
  has_datastream :name => "CONTENT"

  def to_solr(solr_doc=Hash.new,opts={})
    super(solr_doc, opts)
    solr_doc
  end
end
