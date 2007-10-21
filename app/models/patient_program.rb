class PatientProgram < ActiveRecord::Base
  belongs_to :patient, :class_name => 'Patient', :foreign_key => :patient_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :program, :class_name => 'Program', :foreign_key => :program_id
  belongs_to :changed_by, :class_name => 'User', :foreign_key => :changed_by
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :patient_program, :class_name => 'PatientProgram', :foreign_key => :patient_program_id
  has_many :patient_programs, :class_name => 'PatientProgram', :foreign_key => :patient_program_id
  has_many :patient_states, :class_name => 'PatientState', :foreign_key => :patient_program_id
  has_many :programs, :through => :patient_programs
  has_many :creators, :through => :patient_programs_as_creator
  has_many :changed_bies, :through => :patient_programs_as_changed_by
  has_many :patients, :through => :patient_programs
  has_many :voided_bies, :through => :patient_programs_as_voided_by
  has_many :creators, :through => :patient_states_as_creator
  has_many :changed_bies, :through => :patient_states_as_changed_by
  has_many :patient_states, :through => :patient_states
  has_many :voided_bies, :through => :patient_states_as_voided_by
  has_many :states, :through => :patient_states_as_state
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
  validates_inclusion_of :voided, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
end
