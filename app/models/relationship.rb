class Relationship < ActiveRecord::Base
  belongs_to :person, :class_name => 'Person', :foreign_key => :person_id
  belongs_to :relative, :class_name => 'Person', :foreign_key => :relative_id
  belongs_to :relationship, :class_name => 'RelationshipType', :foreign_key => :relationship
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :relationship, :class_name => 'Relationship', :foreign_key => :relationship_id
  has_many :relationships, :class_name => 'Relationship', :foreign_key => :relationship_id
  has_many :creators, :through => :relationships_as_creator
  has_many :relatives, :through => :relationships_as_relative
  has_many :relationships, :through => :relationships_as_relationship
  has_many :voided_bies, :through => :relationships_as_voided_by
  has_many :people, :through => :relationships
  validates_presence_of :relationship
  validates_numericality_of :relationship, :allow_nil => false, :only_integer => true
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_inclusion_of :voided, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
end
