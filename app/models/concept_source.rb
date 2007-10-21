class ConceptSource < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :concept_source, :class_name => 'ConceptSource', :foreign_key => :concept_source_id
  has_many :concept_maps_as_source, :class_name => 'ConceptMap', :foreign_key => :source
  has_many :concept_sources, :class_name => 'ConceptSource', :foreign_key => :concept_source_id
  has_many :creators, :through => :concept_maps_as_creator
  has_many :concept_maps, :through => :concept_maps
  has_many :creators, :through => :concept_sources_as_creator
  has_many :voided_bies, :through => :concept_sources_as_voided_by
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 50
  validates_presence_of :description
  validates_presence_of :hl7_code
  validates_length_of :hl7_code, :allow_nil => false, :maximum => 50
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_numericality_of :voided, :allow_nil => true, :only_integer => true
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
end
