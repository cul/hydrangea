require "hydra"

class MODSMetadata < CoreObject
  
  #has_datastream :name => "CONTENT", :mimeType => 'text/xml'

  has_metadata :name => "CONTENT", :type => Hydra::ModsGenericContent

  def to_solr(solr_doc=Hash.new,opts={})
    super(solr_doc, opts)
    solr_doc
  end
end
