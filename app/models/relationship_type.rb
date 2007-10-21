class RelationshipType < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :relationship_type, :class_name => 'RelationshipType', :foreign_key => :relationship_type_id
  has_many :relationships_as_relationship, :class_name => 'Relationship', :foreign_key => :relationship
  has_many :relationship_types, :class_name => 'RelationshipType', :foreign_key => :relationship_type_id
  has_many :creators, :through => :relationships_as_creator
  has_many :relatives, :through => :relationships_as_relative
  has_many :relationships, :through => :relationships
  has_many :voided_bies, :through => :relationships_as_voided_by
  has_many :people, :through => :relationships
  has_many :creators, :through => :relationship_types_as_creator
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 50
  validates_presence_of :description
  validates_length_of :description, :allow_nil => false, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
