class ConceptDatatype < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :concept_datatype, :class_name => 'ConceptDatatype', :foreign_key => :concept_datatype_id
  has_many :concepts_as_datatype, :class_name => 'Concept', :foreign_key => :datatype_id
  has_many :concept_datatypes, :class_name => 'ConceptDatatype', :foreign_key => :concept_datatype_id
  has_many :concepts, :through => :concepts
  has_many :creators, :through => :concepts_as_creator
  has_many :changed_bies, :through => :concepts_as_changed_by
  has_many :classes, :through => :concepts_as_class
  has_many :creators, :through => :concept_datatypes_as_creator
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_length_of :hl7_abbreviation, :allow_nil => true, :maximum => 3
  validates_presence_of :description
  validates_length_of :description, :allow_nil => false, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
