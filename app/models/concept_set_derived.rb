class ConceptSetDerived < ActiveRecord::Base
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  validates_presence_of :concept_set
  validates_numericality_of :concept_set, :allow_nil => false, :only_integer => true
  validates_numericality_of :sort_weight, :allow_nil => true
end
