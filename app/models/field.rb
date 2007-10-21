class Field < ActiveRecord::Base
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  belongs_to :field_type, :class_name => 'FieldType', :foreign_key => :field_type
  belongs_to :changed_by, :class_name => 'User', :foreign_key => :changed_by
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :field, :class_name => 'Field', :foreign_key => :field_id
  has_many :fields, :class_name => 'Field', :foreign_key => :field_id
  has_many :field_answers, :class_name => 'FieldAnswer', :foreign_key => :field_id
  has_many :form_fields, :class_name => 'FormField', :foreign_key => :field_id
  has_many :concepts, :through => :fields
  has_many :creators, :through => :fields_as_creator
  has_many :changed_bies, :through => :fields_as_changed_by
  has_many :field_types, :through => :fields
  has_many :creators, :through => :field_answers_as_creator
  has_many :answers, :through => :field_answers_as_answer
  has_many :forms, :through => :form_fields
  has_many :creators, :through => :form_fields_as_creator
  has_many :changed_bies, :through => :form_fields_as_changed_by
  has_many :parent_form_fields, :through => :form_fields_as_parent_form_field
  has_many :form_fields, :through => :form_fields
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_numericality_of :field_type, :allow_nil => true, :only_integer => true
  validates_length_of :table_name, :allow_nil => true, :maximum => 50
  validates_length_of :attribute_name, :allow_nil => true, :maximum => 50
  validates_inclusion_of :select_multiple, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
  def type
    self.field_type.name
  end
end
