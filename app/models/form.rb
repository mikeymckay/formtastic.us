class Form < ActiveRecord::Base
  belongs_to :encounter_type, :class_name => 'EncounterType', :foreign_key => :encounter_type
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :changed_by, :class_name => 'User', :foreign_key => :changed_by
  belongs_to :retired_by, :class_name => 'User', :foreign_key => :retired_by
  belongs_to :form, :class_name => 'Form', :foreign_key => :form_id
  has_many :encounters, :class_name => 'Encounter', :foreign_key => :form_id
#  has_many :forms, :class_name => 'Form', :foreign_key => :form_id
  has_many :form_fields, :class_name => 'FormField', :foreign_key => :form_id
#  has_many :encounters, :through => :encounters
#  has_many :creators, :through => :encounters_as_creator
#  has_many :providers, :through => :encounters_as_provider
#  has_many :patients, :through => :encounters
#  has_many :locations, :through => :encounters
#  has_many :encounter_types, :through => :encounters
#  has_many :creators, :through => :forms_as_creator
#  has_many :retired_bies, :through => :forms_as_retired_by
#  has_many :changed_bies, :through => :forms_as_changed_by
#  has_many :encounter_types, :through => :forms
#  has_many :creators, :through => :form_fields_as_creator
#  has_many :changed_bies, :through => :form_fields_as_changed_by
#  has_many :parent_form_fields, :through => :form_fields_as_parent_form_field
  has_many :fields, :through => :form_fields
#  has_many :form_fields, :through => :form_fields
#  validates_presence_of :name
#  validates_length_of :name, :allow_nil => false, :maximum => 255
#  validates_presence_of :version
#  validates_length_of :version, :allow_nil => false, :maximum => 50
#  validates_numericality_of :build, :allow_nil => true, :only_integer => true
#  validates_presence_of :published
#  validates_numericality_of :published, :allow_nil => false, :only_integer => true
#  validates_numericality_of :encounter_type, :allow_nil => true, :only_integer => true
#  validates_length_of :schema_namespace, :allow_nil => true, :maximum => 255
#  validates_length_of :infopath_solution_version, :allow_nil => true, :maximum => 50
#  validates_length_of :uri, :allow_nil => true, :maximum => 255
#  validates_presence_of :creator
#  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
#  validates_presence_of :date_created
#  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
#  validates_inclusion_of :retired, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
#  validates_numericality_of :retired_by, :allow_nil => true, :only_integer => true
#  validates_length_of :retired_reason, :allow_nil => true, :maximum => 255
#
end
