class ProgramWorkflowState < ActiveRecord::Base
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :program_workflow, :class_name => 'ProgramWorkflow', :foreign_key => :program_workflow_id
  belongs_to :program_workflow_state, :class_name => 'ProgramWorkflowState', :foreign_key => :program_workflow_state_id
  has_many :concept_state_conversions, :class_name => 'ConceptStateConversion', :foreign_key => :program_workflow_state_id
  has_many :patient_states_as_state, :class_name => 'PatientState', :foreign_key => :state
  has_many :program_workflow_states, :class_name => 'ProgramWorkflowState', :foreign_key => :program_workflow_state_id
  has_many :concepts, :through => :concept_state_conversions
  has_many :program_workflows, :through => :concept_state_conversions
  has_many :concept_state_conversions, :through => :concept_state_conversions
  has_many :creators, :through => :patient_states_as_creator
  has_many :changed_bies, :through => :patient_states_as_changed_by
  has_many :patient_states, :through => :patient_states
  has_many :patient_programs, :through => :patient_states
  has_many :voided_bies, :through => :patient_states_as_voided_by
  has_many :concepts, :through => :program_workflow_states
  has_many :creators, :through => :program_workflow_states_as_creator
  has_many :program_workflows, :through => :program_workflow_states
  has_many :voided_bies, :through => :program_workflow_states_as_voided_by
  validates_inclusion_of :initial, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_inclusion_of :terminal, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_inclusion_of :voided, :in => [true, false], :allow_nil => true, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
end
