class ConceptName < ActiveRecord::Base
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_length_of :short_name, :allow_nil => true, :maximum => 255
  validates_presence_of :description
  validates_presence_of :locale
  validates_length_of :locale, :allow_nil => false, :maximum => 50
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
