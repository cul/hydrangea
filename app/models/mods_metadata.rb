require "hydra"

class MODSMetadata < CoreObject
  
  has_datastream :name => "CONTENT", :mimeType => 'text/xml'

  def to_solr(solr_doc=Hash.new,opts={})
    super(solr_doc, opts)
    solr_doc
  end
end
