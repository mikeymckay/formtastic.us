class FormField < ActiveRecord::Base
  set_primary_key :form_field_id
  belongs_to :field, :class_name => 'Field', :foreign_key => :field_id
  belongs_to :form, :class_name => 'Form', :foreign_key => :form_id
#  belongs_to :parent_form_field, :class_name => 'FormField', :foreign_key => :parent_form_field
#  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
#  belongs_to :changed_by, :class_name => 'User', :foreign_key => :changed_by
#  belongs_to :form_field, :class_name => 'FormField', :foreign_key => :form_field_id
#  has_many :form_fields_as_parent_form_field, :class_name => 'FormField', :foreign_key => :parent_form_field
#  has_many :form_fields, :class_name => 'FormField', :foreign_key => :form_field_id
#  has_many :forms, :through => :form_fields
#  has_many :creators, :through => :form_fields_as_creator
#  has_many :changed_bies, :through => :form_fields_as_changed_by
#  has_many :fields, :through => :form_fields
#  has_many :form_fields, :through => :form_fields
#  has_many :forms, :through => :form_fields
#  has_many :creators, :through => :form_fields_as_creator
#  has_many :changed_bies, :through => :form_fields_as_changed_by
#  has_many :parent_form_fields, :through => :form_fields_as_parent_form_field
#  has_many :fields, :through => :form_fields
#  validates_numericality_of :field_number, :allow_nil => true, :only_integer => true
#  validates_length_of :field_part, :allow_nil => true, :maximum => 5
#  validates_numericality_of :page_number, :allow_nil => true, :only_integer => true
#  validates_numericality_of :parent_form_field, :allow_nil => true, :only_integer => true
#  validates_numericality_of :min_occurs, :allow_nil => true, :only_integer => true
#  validates_numericality_of :max_occurs, :allow_nil => true, :only_integer => true
#  validates_inclusion_of :required, :in => [true, false], :allow_nil => true, :message => ActiveRecord::Errors.default_error_messages[:blank]
#  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
#  validates_presence_of :creator
#  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
#  validates_presence_of :date_created
end
