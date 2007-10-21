class ConceptStateConversion < ActiveRecord::Base
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  belongs_to :program_workflow, :class_name => 'ProgramWorkflow', :foreign_key => :program_workflow_id
  belongs_to :program_workflow_state, :class_name => 'ProgramWorkflowState', :foreign_key => :program_workflow_state_id
  belongs_to :concept_state_conversion, :class_name => 'ConceptStateConversion', :foreign_key => :concept_state_conversion_id
  has_many :concept_state_conversions, :class_name => 'ConceptStateConversion', :foreign_key => :concept_state_conversion_id
  has_many :concepts, :through => :concept_state_conversions
  has_many :program_workflow_states, :through => :concept_state_conversions
  has_many :program_workflows, :through => :concept_state_conversions
end
