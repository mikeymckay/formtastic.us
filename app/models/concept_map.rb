class ConceptMap < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :source, :class_name => 'ConceptSource', :foreign_key => :source
  belongs_to :concept_map, :class_name => 'ConceptMap', :foreign_key => :concept_map_id
  has_many :concept_maps, :class_name => 'ConceptMap', :foreign_key => :concept_map_id
  has_many :creators, :through => :concept_maps_as_creator
  has_many :sources, :through => :concept_maps_as_source
  validates_numericality_of :source, :allow_nil => true, :only_integer => true
  validates_length_of :comment, :allow_nil => true, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
