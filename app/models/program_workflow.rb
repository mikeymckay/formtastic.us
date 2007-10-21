class ProgramWorkflow < ActiveRecord::Base
  belongs_to :program, :class_name => 'Program', :foreign_key => :program_id
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :program_workflow, :class_name => 'ProgramWorkflow', :foreign_key => :program_workflow_id
  has_many :concept_state_conversions, :class_name => 'ConceptStateConversion', :foreign_key => :program_workflow_id
  has_many :program_workflows, :class_name => 'ProgramWorkflow', :foreign_key => :program_workflow_id
  has_many :program_workflow_states, :class_name => 'ProgramWorkflowState', :foreign_key => :program_workflow_id
  has_many :concepts, :through => :concept_state_conversions
  has_many :program_workflow_states, :through => :concept_state_conversions
  has_many :concept_state_conversions, :through => :concept_state_conversions
  has_many :concepts, :through => :program_workflows
  has_many :programs, :through => :program_workflows
  has_many :creators, :through => :program_workflows_as_creator
  has_many :voided_bies, :through => :program_workflows_as_voided_by
  has_many :concepts, :through => :program_workflow_states
  has_many :creators, :through => :program_workflow_states_as_creator
  has_many :program_workflow_states, :through => :program_workflow_states
  has_many :voided_bies, :through => :program_workflow_states_as_voided_by
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_inclusion_of :voided, :in => [true, false], :allow_nil => true, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
end
