require 'hydra'

class Resource < ActiveFedora::Base
  include Hydra::ModelMethods
  
  # Uses the Hydra Rights Metadataf Schema for tracking access permissions & copyright
  #has_metadata :name => "rightsMetadata", :type => Hydra::RightsMetadata 

  #has_metadata :name => "descMetadata", :type => Hydra::ModsGenericContent

  # A place to put extra metadata values
  #has_metadata :name => "properties", :type => ActiveFedora::MetadataDatastream do |m|
    #m.field 'collection', :string
    #m.field 'depositor', :string
  #end
 
  has_relationship "partOf", :member_of, :type => StaticImageAggregator

  def initialize( attrs={} )
    super
  end
end
