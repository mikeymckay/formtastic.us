class FieldType < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :field_type, :class_name => 'FieldType', :foreign_key => :field_type_id
  has_many :fields, :class_name => 'Field', :foreign_key => :field_type
  has_many :field_types, :class_name => 'FieldType', :foreign_key => :field_type_id
  has_many :concepts, :through => :fields
  has_many :creators, :through => :fields_as_creator
  has_many :changed_bies, :through => :fields_as_changed_by
  has_many :fields, :through => :fields
  has_many :creators, :through => :field_types_as_creator
  validates_length_of :name, :allow_nil => true, :maximum => 50
  validates_inclusion_of :is_set, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
