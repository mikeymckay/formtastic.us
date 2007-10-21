class ConceptClas < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :concept_class, :class_name => 'ConceptClas', :foreign_key => :concept_class_id
  has_many :concepts_as_class, :class_name => 'Concept', :foreign_key => :class_id
  has_many :concept_classes_as_concept_class, :class_name => 'ConceptClas', :foreign_key => :concept_class_id
  has_many :concepts, :through => :concepts
  has_many :datatypes, :through => :concepts_as_datatype
  has_many :creators, :through => :concepts_as_creator
  has_many :changed_bies, :through => :concepts_as_changed_by
  has_many :creators, :through => :concept_classes_as_creator
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_presence_of :description
  validates_length_of :description, :allow_nil => false, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
