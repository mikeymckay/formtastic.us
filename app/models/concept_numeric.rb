class ConceptNumeric < ActiveRecord::Base
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  validates_numericality_of :hi_absolute, :allow_nil => true
  validates_numericality_of :hi_critical, :allow_nil => true
  validates_numericality_of :hi_normal, :allow_nil => true
  validates_numericality_of :low_absolute, :allow_nil => true
  validates_numericality_of :low_critical, :allow_nil => true
  validates_numericality_of :low_normal, :allow_nil => true
  validates_length_of :units, :allow_nil => true, :maximum => 50
  validates_inclusion_of :precise, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
end
