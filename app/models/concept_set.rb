class ConceptSet < ActiveRecord::Base
  belongs_to :concept_set, :class_name => 'Concept', :foreign_key => :concept_set
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  validates_presence_of :concept_set
  validates_numericality_of :concept_set, :allow_nil => false, :only_integer => true
  validates_numericality_of :sort_weight, :allow_nil => true
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
