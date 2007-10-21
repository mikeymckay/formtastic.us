class Concept < ActiveRecord::Base
  belongs_to :class, :class_name => 'ConceptClas', :foreign_key => :class_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :datatype, :class_name => 'ConceptDatatype', :foreign_key => :datatype_id
  belongs_to :changed_by, :class_name => 'User', :foreign_key => :changed_by
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  has_many :concepts, :class_name => 'Concept', :foreign_key => :concept_id
  has_many :concept_answers_as_answer_concept, :class_name => 'ConceptAnswer', :foreign_key => :answer_concept
  has_many :concept_answers, :class_name => 'ConceptAnswer', :foreign_key => :concept_id
  has_many :concept_names, :class_name => 'ConceptName', :foreign_key => :concept_id
  has_many :concept_numerics, :class_name => 'ConceptNumeric', :foreign_key => :concept_id
  has_many :concept_proposals, :class_name => 'ConceptProposal', :foreign_key => :concept_id
  has_many :concept_proposals_as_obs_concept, :class_name => 'ConceptProposal', :foreign_key => :obs_concept_id
  has_many :concept_sets_as_concept_set, :class_name => 'ConceptSet', :foreign_key => :concept_set
  has_many :concept_sets, :class_name => 'ConceptSet', :foreign_key => :concept_id
  has_many :concept_set_deriveds, :class_name => 'ConceptSetDerived', :foreign_key => :concept_id
  has_many :concept_state_conversions, :class_name => 'ConceptStateConversion', :foreign_key => :concept_id
  has_many :concept_synonyms, :class_name => 'ConceptSynonym', :foreign_key => :concept_id
  has_many :concept_words, :class_name => 'ConceptWord', :foreign_key => :concept_id
  has_many :drugs, :class_name => 'Drug', :foreign_key => :concept_id
  has_many :drug_ingredients, :class_name => 'DrugIngredient', :foreign_key => :concept_id
  has_many :drug_ingredients_as_ingredient, :class_name => 'DrugIngredient', :foreign_key => :ingredient_id
  has_many :fields, :class_name => 'Field', :foreign_key => :concept_id
  has_many :field_answers_as_answer, :class_name => 'FieldAnswer', :foreign_key => :answer_id
  has_many :obs_as_value_coded, :class_name => 'Ob', :foreign_key => :value_coded
  has_many :obs, :class_name => 'Ob', :foreign_key => :concept_id
  has_many :orders, :class_name => 'Order', :foreign_key => :concept_id
  has_many :programs, :class_name => 'Program', :foreign_key => :concept_id
  has_many :program_workflows, :class_name => 'ProgramWorkflow', :foreign_key => :concept_id
  has_many :program_workflow_states, :class_name => 'ProgramWorkflowState', :foreign_key => :concept_id
  has_many :datatypes, :through => :concepts_as_datatype
  has_many :creators, :through => :concepts_as_creator
  has_many :changed_bies, :through => :concepts_as_changed_by
  has_many :classes, :through => :concepts_as_class
  has_many :creators, :through => :concept_answers_as_creator
  has_many :concept_answers, :through => :concept_answers
  has_many :answer_concepts, :through => :concept_answers_as_answer_concept
  has_many :concepts, :through => :concept_answers
  has_many :creators, :through => :concept_answers_as_creator
  has_many :concept_answers, :through => :concept_answers
  has_many :creators, :through => :concept_names_as_creator
  has_many :encounters, :through => :concept_proposals
  has_many :creators, :through => :concept_proposals_as_creator
  has_many :changed_bies, :through => :concept_proposals_as_changed_by
  has_many :concept_proposals, :through => :concept_proposals
  has_many :obs, :through => :concept_proposals_as_obs
  has_many :obs_concepts, :through => :concept_proposals_as_obs_concept
  has_many :encounters, :through => :concept_proposals
  has_many :concepts, :through => :concept_proposals
  has_many :creators, :through => :concept_proposals_as_creator
  has_many :changed_bies, :through => :concept_proposals_as_changed_by
  has_many :concept_proposals, :through => :concept_proposals
  has_many :obs, :through => :concept_proposals_as_obs
  has_many :creators, :through => :concept_sets_as_creator
  has_many :concept_sets, :through => :concept_sets_as_concept_set
  has_many :concepts, :through => :concept_sets
  has_many :creators, :through => :concept_sets_as_creator
  has_many :program_workflow_states, :through => :concept_state_conversions
  has_many :program_workflows, :through => :concept_state_conversions
  has_many :concept_state_conversions, :through => :concept_state_conversions
  has_many :creators, :through => :concept_synonyms_as_creator
  has_many :creators, :through => :drugs_as_creator
  has_many :drugs, :through => :drugs
  has_many :ingredients, :through => :drug_ingredients_as_ingredient
  has_many :concepts, :through => :drug_ingredients
  has_many :creators, :through => :fields_as_creator
  has_many :changed_bies, :through => :fields_as_changed_by
  has_many :fields, :through => :fields
  has_many :field_types, :through => :fields
  has_many :creators, :through => :field_answers_as_creator
  has_many :fields, :through => :field_answers
  has_many :encounters, :through => :obs
  has_many :orders, :through => :obs
  has_many :creators, :through => :obs_as_creator
  has_many :patients, :through => :obs
  has_many :locations, :through => :obs
  has_many :voided_bies, :through => :obs_as_voided_by
  has_many :value_drugs, :through => :obs_as_value_drug
  has_many :obs, :through => :obs_as_obs
  has_many :value_codeds, :through => :obs_as_value_coded
  has_many :concepts, :through => :obs
  has_many :encounters, :through => :obs
  has_many :orders, :through => :obs
  has_many :creators, :through => :obs_as_creator
  has_many :patients, :through => :obs
  has_many :locations, :through => :obs
  has_many :voided_bies, :through => :obs_as_voided_by
  has_many :value_drugs, :through => :obs_as_value_drug
  has_many :obs, :through => :obs_as_obs
  has_many :encounters, :through => :orders
  has_many :orders, :through => :orders
  has_many :creators, :through => :orders_as_creator
  has_many :voided_bies, :through => :orders_as_voided_by
  has_many :discontinued_bies, :through => :orders_as_discontinued_by
  has_many :order_types, :through => :orders
  has_many :orderers, :through => :orders_as_orderer
  has_many :programs, :through => :programs
  has_many :creators, :through => :programs_as_creator
  has_many :changed_bies, :through => :programs_as_changed_by
  has_many :voided_bies, :through => :programs_as_voided_by
  has_many :programs, :through => :program_workflows
  has_many :creators, :through => :program_workflows_as_creator
  has_many :program_workflows, :through => :program_workflows
  has_many :voided_bies, :through => :program_workflows_as_voided_by
  has_many :creators, :through => :program_workflow_states_as_creator
  has_many :program_workflow_states, :through => :program_workflow_states
  has_many :program_workflows, :through => :program_workflow_states
  has_many :voided_bies, :through => :program_workflow_states_as_voided_by
  validates_inclusion_of :retired, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_length_of :short_name, :allow_nil => true, :maximum => 255
  validates_inclusion_of :is_set, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_length_of :icd10, :allow_nil => true, :maximum => 255
  validates_length_of :loinc, :allow_nil => true, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_numericality_of :default_charge, :allow_nil => true, :only_integer => true
  validates_length_of :version, :allow_nil => true, :maximum => 50
  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
  validates_length_of :form_location, :allow_nil => true, :maximum => 50
  validates_length_of :units, :allow_nil => true, :maximum => 50
  validates_numericality_of :view_count, :allow_nil => true, :only_integer => true
end
