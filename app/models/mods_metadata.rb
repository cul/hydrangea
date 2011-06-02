require "hydra"

module Cul
module Fedora
module Core
class MODSMetadata < Cul::Fedora::Core::CoreObject
  
  include Hydra::ModelMethods
  
  has_datastream :name => "CONTENT", :mimeType => 'text/xml'

  def to_solr(solr_doc=Hash.new,opts={})
    super(solr_doc, opts)
    solr_doc
  end
end
end
end
end
