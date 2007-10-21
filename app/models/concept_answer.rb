class ConceptAnswer < ActiveRecord::Base
  belongs_to :answer_concept, :class_name => 'Concept', :foreign_key => :answer_concept
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :concept_answer, :class_name => 'ConceptAnswer', :foreign_key => :concept_answer_id
  has_many :concept_answers, :class_name => 'ConceptAnswer', :foreign_key => :concept_answer_id
  has_many :concepts, :through => :concept_answers
  has_many :creators, :through => :concept_answers_as_creator
  has_many :answer_concepts, :through => :concept_answers_as_answer_concept
  validates_numericality_of :answer_concept, :allow_nil => true, :only_integer => true
  validates_numericality_of :answer_drug, :allow_nil => true, :only_integer => true
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
