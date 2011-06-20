require "hydra"

class CoreObject < ActiveFedora::Base
  include Hydra::ModelMethods

  include ActiveFedora::SemanticNode

  include Cul::Core

  def initialize(attrs={})
    super(attrs)
  end

  def to_solr(solr_doc=Hash.new,opts={})
    super(solr_doc, opts)
    solr_doc
  end

end
