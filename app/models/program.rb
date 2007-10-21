class Program < ActiveRecord::Base
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :changed_by, :class_name => 'User', :foreign_key => :changed_by
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :program, :class_name => 'Program', :foreign_key => :program_id
  has_many :patient_programs, :class_name => 'PatientProgram', :foreign_key => :program_id
  has_many :programs, :class_name => 'Program', :foreign_key => :program_id
  has_many :program_workflows, :class_name => 'ProgramWorkflow', :foreign_key => :program_id
  has_many :creators, :through => :patient_programs_as_creator
  has_many :changed_bies, :through => :patient_programs_as_changed_by
  has_many :patients, :through => :patient_programs
  has_many :patient_programs, :through => :patient_programs
  has_many :voided_bies, :through => :patient_programs_as_voided_by
  has_many :concepts, :through => :programs
  has_many :creators, :through => :programs_as_creator
  has_many :changed_bies, :through => :programs_as_changed_by
  has_many :voided_bies, :through => :programs_as_voided_by
  has_many :concepts, :through => :program_workflows
  has_many :creators, :through => :program_workflows_as_creator
  has_many :program_workflows, :through => :program_workflows
  has_many :voided_bies, :through => :program_workflows_as_voided_by
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
  validates_inclusion_of :voided, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
end
