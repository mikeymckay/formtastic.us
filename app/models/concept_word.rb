class ConceptWord < ActiveRecord::Base
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  validates_presence_of :word
  validates_length_of :word, :allow_nil => false, :maximum => 50
  validates_presence_of :synonym
  validates_length_of :synonym, :allow_nil => false, :maximum => 255
  validates_presence_of :locale
  validates_length_of :locale, :allow_nil => false, :maximum => 20
end
