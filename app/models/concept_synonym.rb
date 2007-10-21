class ConceptSynonym < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  validates_presence_of :synonym
  validates_length_of :synonym, :allow_nil => false, :maximum => 255
  validates_length_of :locale, :allow_nil => true, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
