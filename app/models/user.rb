class User < ActiveRecord::Base
  set_primary_key "user_id"
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :changed_by, :class_name => 'User', :foreign_key => :changed_by
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :user, :class_name => 'User', :foreign_key => :user_id
  has_many :concepts_as_creator, :class_name => 'Concept', :foreign_key => :creator
  has_many :concepts_as_changed_by, :class_name => 'Concept', :foreign_key => :changed_by
  has_many :concept_answers_as_creator, :class_name => 'ConceptAnswer', :foreign_key => :creator
  has_many :concept_classes_as_creator, :class_name => 'ConceptClas', :foreign_key => :creator
  has_many :concept_datatypes_as_creator, :class_name => 'ConceptDatatype', :foreign_key => :creator
  has_many :concept_maps_as_creator, :class_name => 'ConceptMap', :foreign_key => :creator
  has_many :concept_names_as_creator, :class_name => 'ConceptName', :foreign_key => :creator
  has_many :concept_proposals_as_changed_by, :class_name => 'ConceptProposal', :foreign_key => :changed_by
  has_many :concept_proposals_as_creator, :class_name => 'ConceptProposal', :foreign_key => :creator
  has_many :concept_sets_as_creator, :class_name => 'ConceptSet', :foreign_key => :creator
  has_many :concept_sources_as_creator, :class_name => 'ConceptSource', :foreign_key => :creator
  has_many :concept_sources_as_voided_by, :class_name => 'ConceptSource', :foreign_key => :voided_by
  has_many :concept_synonyms_as_creator, :class_name => 'ConceptSynonym', :foreign_key => :creator
  has_many :drugs_as_creator, :class_name => 'Drug', :foreign_key => :creator
  has_many :encounters_as_creator, :class_name => 'Encounter', :foreign_key => :creator
  has_many :encounters_as_provider, :class_name => 'Encounter', :foreign_key => :provider_id
  has_many :encounter_types_as_creator, :class_name => 'EncounterType', :foreign_key => :creator
  has_many :fields_as_changed_by, :class_name => 'Field', :foreign_key => :changed_by
  has_many :fields_as_creator, :class_name => 'Field', :foreign_key => :creator
  has_many :field_answers_as_creator, :class_name => 'FieldAnswer', :foreign_key => :creator
  has_many :field_types_as_creator, :class_name => 'FieldType', :foreign_key => :creator
  has_many :forms_as_creator, :class_name => 'Form', :foreign_key => :creator
  has_many :forms_as_changed_by, :class_name => 'Form', :foreign_key => :changed_by
  has_many :forms_as_retired_by, :class_name => 'Form', :foreign_key => :retired_by
  has_many :form_fields_as_creator, :class_name => 'FormField', :foreign_key => :creator
  has_many :form_fields_as_changed_by, :class_name => 'FormField', :foreign_key => :changed_by
  has_many :formentry_archives_as_creator, :class_name => 'FormentryArchive', :foreign_key => :creator
  has_many :formentry_errors_as_creator, :class_name => 'FormentryError', :foreign_key => :creator
  has_many :hl7_sources_as_creator, :class_name => 'Hl7Source', :foreign_key => :creator
  has_many :locations_as_creator, :class_name => 'Location', :foreign_key => :creator
  has_many :notes_as_changed_by, :class_name => 'Note', :foreign_key => :changed_by
  has_many :notes_as_creator, :class_name => 'Note', :foreign_key => :creator
  has_many :notification_alerts_as_creator, :class_name => 'NotificationAlert', :foreign_key => :creator
  has_many :notification_alerts_as_changed_by, :class_name => 'NotificationAlert', :foreign_key => :changed_by
  has_many :notification_alert_recipients, :class_name => 'NotificationAlertRecipient', :foreign_key => :user_id
  has_many :obs_as_creator, :class_name => 'Ob', :foreign_key => :creator
  has_many :obs_as_voided_by, :class_name => 'Ob', :foreign_key => :voided_by
  has_many :orders_as_orderer, :class_name => 'Order', :foreign_key => :orderer
  has_many :orders_as_creator, :class_name => 'Order', :foreign_key => :creator
  has_many :orders_as_discontinued_by, :class_name => 'Order', :foreign_key => :discontinued_by
  has_many :orders_as_voided_by, :class_name => 'Order', :foreign_key => :voided_by
  has_many :order_types_as_creator, :class_name => 'OrderType', :foreign_key => :creator
  has_many :patients_as_changed_by, :class_name => 'Patient', :foreign_key => :changed_by
  has_many :patients_as_creator, :class_name => 'Patient', :foreign_key => :creator
  has_many :patients_as_voided_by, :class_name => 'Patient', :foreign_key => :voided_by
  has_many :patient_addresses_as_creator, :class_name => 'PatientAddres', :foreign_key => :creator
  has_many :patient_addresses_as_voided_by, :class_name => 'PatientAddres', :foreign_key => :voided_by
  has_many :patient_identifiers_as_creator, :class_name => 'PatientIdentifier', :foreign_key => :creator
  has_many :patient_identifiers_as_voided_by, :class_name => 'PatientIdentifier', :foreign_key => :voided_by
  has_many :patient_identifier_types_as_creator, :class_name => 'PatientIdentifierType', :foreign_key => :creator
  has_many :patient_names_as_creator, :class_name => 'PatientName', :foreign_key => :creator
  has_many :patient_names_as_voided_by, :class_name => 'PatientName', :foreign_key => :voided_by
  has_many :patient_programs_as_creator, :class_name => 'PatientProgram', :foreign_key => :creator
  has_many :patient_programs_as_changed_by, :class_name => 'PatientProgram', :foreign_key => :changed_by
  has_many :patient_programs_as_voided_by, :class_name => 'PatientProgram', :foreign_key => :voided_by
  has_many :patient_states_as_changed_by, :class_name => 'PatientState', :foreign_key => :changed_by
  has_many :patient_states_as_creator, :class_name => 'PatientState', :foreign_key => :creator
  has_many :patient_states_as_voided_by, :class_name => 'PatientState', :foreign_key => :voided_by
  has_many :people, :class_name => 'Person', :foreign_key => :user_id
  has_many :programs_as_creator, :class_name => 'Program', :foreign_key => :creator
  has_many :programs_as_changed_by, :class_name => 'Program', :foreign_key => :changed_by
  has_many :programs_as_voided_by, :class_name => 'Program', :foreign_key => :voided_by
  has_many :program_workflows_as_creator, :class_name => 'ProgramWorkflow', :foreign_key => :creator
  has_many :program_workflows_as_voided_by, :class_name => 'ProgramWorkflow', :foreign_key => :voided_by
  has_many :program_workflow_states_as_creator, :class_name => 'ProgramWorkflowState', :foreign_key => :creator
  has_many :program_workflow_states_as_voided_by, :class_name => 'ProgramWorkflowState', :foreign_key => :voided_by
  has_many :relationships_as_creator, :class_name => 'Relationship', :foreign_key => :creator
  has_many :relationships_as_voided_by, :class_name => 'Relationship', :foreign_key => :voided_by
  has_many :relationship_types_as_creator, :class_name => 'RelationshipType', :foreign_key => :creator
  has_many :reports_as_creator, :class_name => 'Report', :foreign_key => :creator
  has_many :reports_as_changed_by, :class_name => 'Report', :foreign_key => :changed_by
  has_many :reports_as_voided_by, :class_name => 'Report', :foreign_key => :voided_by
  has_many :report_objects_as_creator, :class_name => 'ReportObject', :foreign_key => :creator
  has_many :report_objects_as_changed_by, :class_name => 'ReportObject', :foreign_key => :changed_by
  has_many :report_objects_as_voided_by, :class_name => 'ReportObject', :foreign_key => :voided_by
  has_many :scheduler_task_configs_as_changed_by, :class_name => 'SchedulerTaskConfig', :foreign_key => :changed_by
  has_many :scheduler_task_configs_as_created_by, :class_name => 'SchedulerTaskConfig', :foreign_key => :created_by
  has_many :users_as_creator, :class_name => 'User', :foreign_key => :creator
  has_many :users_as_changed_by, :class_name => 'User', :foreign_key => :changed_by
  has_many :users_as_voided_by, :class_name => 'User', :foreign_key => :voided_by
  has_many :users, :class_name => 'User', :foreign_key => :user_id
  has_many :user_properties, :class_name => 'UserProperty', :foreign_key => :user_id
  has_many :user_roles, :class_name => 'UserRole', :foreign_key => :user_id
  has_many :concepts, :through => :concepts
  has_many :datatypes, :through => :concepts_as_datatype
  has_many :changed_bies, :through => :concepts_as_changed_by
  has_many :classes, :through => :concepts_as_class
  has_many :concepts, :through => :concepts
  has_many :datatypes, :through => :concepts_as_datatype
  has_many :creators, :through => :concepts_as_creator
  has_many :classes, :through => :concepts_as_class
  has_many :concepts, :through => :concept_answers
  has_many :concept_answers, :through => :concept_answers
  has_many :answer_concepts, :through => :concept_answers_as_answer_concept
  has_many :concept_classes, :through => :concept_classes_as_concept_class
  has_many :concept_datatypes, :through => :concept_datatypes
  has_many :concept_maps, :through => :concept_maps
  has_many :sources, :through => :concept_maps_as_source
  has_many :concepts, :through => :concept_names
  has_many :encounters, :through => :concept_proposals
  has_many :concepts, :through => :concept_proposals
  has_many :changed_bies, :through => :concept_proposals_as_changed_by
  has_many :concept_proposals, :through => :concept_proposals
  has_many :obs, :through => :concept_proposals_as_obs
  has_many :obs_concepts, :through => :concept_proposals_as_obs_concept
  has_many :encounters, :through => :concept_proposals
  has_many :concepts, :through => :concept_proposals
  has_many :creators, :through => :concept_proposals_as_creator
  has_many :concept_proposals, :through => :concept_proposals
  has_many :obs, :through => :concept_proposals_as_obs
  has_many :obs_concepts, :through => :concept_proposals_as_obs_concept
  has_many :concepts, :through => :concept_sets
  has_many :concept_sets, :through => :concept_sets_as_concept_set
  has_many :concept_sources, :through => :concept_sources
  has_many :voided_bies, :through => :concept_sources_as_voided_by
  has_many :concept_sources, :through => :concept_sources
  has_many :creators, :through => :concept_sources_as_creator
  has_many :concepts, :through => :concept_synonyms
  has_many :concepts, :through => :drugs
  has_many :drugs, :through => :drugs
  has_many :encounters, :through => :encounters
  has_many :forms, :through => :encounters
  has_many :providers, :through => :encounters_as_provider
  has_many :patients, :through => :encounters
  has_many :locations, :through => :encounters
  has_many :encounter_types, :through => :encounters
  has_many :encounters, :through => :encounters
  has_many :forms, :through => :encounters
  has_many :creators, :through => :encounters_as_creator
  has_many :patients, :through => :encounters
  has_many :locations, :through => :encounters
  has_many :encounter_types, :through => :encounters
  has_many :encounter_types, :through => :encounter_types
  has_many :concepts, :through => :fields
  has_many :changed_bies, :through => :fields_as_changed_by
  has_many :fields, :through => :fields
  has_many :field_types, :through => :fields
  has_many :concepts, :through => :fields
  has_many :creators, :through => :fields_as_creator
  has_many :fields, :through => :fields
  has_many :field_types, :through => :fields
  has_many :fields, :through => :field_answers
  has_many :answers, :through => :field_answers_as_answer
  has_many :field_types, :through => :field_types
  has_many :forms, :through => :forms
  has_many :retired_bies, :through => :forms_as_retired_by
  has_many :changed_bies, :through => :forms_as_changed_by
  has_many :encounter_types, :through => :forms
  has_many :forms, :through => :forms
  has_many :creators, :through => :forms_as_creator
  has_many :changed_bies, :through => :forms_as_changed_by
  has_many :encounter_types, :through => :forms
  has_many :forms, :through => :forms
  has_many :creators, :through => :forms_as_creator
  has_many :retired_bies, :through => :forms_as_retired_by
  has_many :encounter_types, :through => :forms
  has_many :forms, :through => :form_fields
  has_many :changed_bies, :through => :form_fields_as_changed_by
  has_many :parent_form_fields, :through => :form_fields_as_parent_form_field
  has_many :fields, :through => :form_fields
  has_many :form_fields, :through => :form_fields
  has_many :forms, :through => :form_fields
  has_many :creators, :through => :form_fields_as_creator
  has_many :parent_form_fields, :through => :form_fields_as_parent_form_field
  has_many :fields, :through => :form_fields
  has_many :form_fields, :through => :form_fields
  has_many :formentry_archives, :through => :formentry_archives
  has_many :formentry_errors, :through => :formentry_errors
  has_many :hl7_sources, :through => :hl7_sources
  has_many :locations, :through => :locations
  has_many :encounters, :through => :notes
  has_many :notes, :through => :notes
  has_many :changed_bies, :through => :notes_as_changed_by
  has_many :patients, :through => :notes
  has_many :obs, :through => :notes_as_obs
  has_many :parents, :through => :notes_as_parent
  has_many :encounters, :through => :notes
  has_many :notes, :through => :notes
  has_many :creators, :through => :notes_as_creator
  has_many :patients, :through => :notes
  has_many :obs, :through => :notes_as_obs
  has_many :parents, :through => :notes_as_parent
  has_many :changed_bies, :through => :notification_alerts_as_changed_by
  has_many :creators, :through => :notification_alerts_as_creator
  has_many :alerts, :through => :notification_alert_recipients_as_alert
  has_many :concepts, :through => :obs
  has_many :encounters, :through => :obs
  has_many :orders, :through => :obs
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
  has_many :value_drugs, :through => :obs_as_value_drug
  has_many :obs, :through => :obs_as_obs
  has_many :value_codeds, :through => :obs_as_value_coded
  has_many :concepts, :through => :orders
  has_many :encounters, :through => :orders
  has_many :orders, :through => :orders
  has_many :voided_bies, :through => :orders_as_voided_by
  has_many :discontinued_bies, :through => :orders_as_discontinued_by
  has_many :order_types, :through => :orders
  has_many :orderers, :through => :orders_as_orderer
  has_many :concepts, :through => :orders
  has_many :encounters, :through => :orders
  has_many :orders, :through => :orders
  has_many :creators, :through => :orders_as_creator
  has_many :discontinued_bies, :through => :orders_as_discontinued_by
  has_many :order_types, :through => :orders
  has_many :orderers, :through => :orders_as_orderer
  has_many :concepts, :through => :orders
  has_many :encounters, :through => :orders
  has_many :orders, :through => :orders
  has_many :creators, :through => :orders_as_creator
  has_many :voided_bies, :through => :orders_as_voided_by
  has_many :order_types, :through => :orders
  has_many :orderers, :through => :orders_as_orderer
  has_many :concepts, :through => :orders
  has_many :encounters, :through => :orders
  has_many :orders, :through => :orders
  has_many :creators, :through => :orders_as_creator
  has_many :voided_bies, :through => :orders_as_voided_by
  has_many :discontinued_bies, :through => :orders_as_discontinued_by
  has_many :order_types, :through => :orders
  has_many :order_types, :through => :order_types
  has_many :changed_bies, :through => :patients_as_changed_by
  has_many :patients, :through => :patients
  has_many :voided_bies, :through => :patients_as_voided_by
  has_many :tribes, :through => :patients
  has_many :creators, :through => :patients_as_creator
  has_many :patients, :through => :patients
  has_many :voided_bies, :through => :patients_as_voided_by
  has_many :tribes, :through => :patients
  has_many :creators, :through => :patients_as_creator
  has_many :changed_bies, :through => :patients_as_changed_by
  has_many :patients, :through => :patients
  has_many :tribes, :through => :patients
  has_many :patient_addresses, :through => :patient_addresses_as_patient_address
  has_many :patients, :through => :patient_addresses
  has_many :voided_bies, :through => :patient_addresses_as_voided_by
  has_many :patient_addresses, :through => :patient_addresses_as_patient_address
  has_many :creators, :through => :patient_addresses_as_creator
  has_many :patients, :through => :patient_addresses
  has_many :patients, :through => :patient_identifiers
  has_many :locations, :through => :patient_identifiers
  has_many :identifier_types, :through => :patient_identifiers_as_identifier_type
  has_many :voided_bies, :through => :patient_identifiers_as_voided_by
  has_many :creators, :through => :patient_identifiers_as_creator
  has_many :patients, :through => :patient_identifiers
  has_many :locations, :through => :patient_identifiers
  has_many :identifier_types, :through => :patient_identifiers_as_identifier_type
  has_many :patient_identifier_types, :through => :patient_identifier_types
  has_many :patient_names, :through => :patient_names
  has_many :patients, :through => :patient_names
  has_many :voided_bies, :through => :patient_names_as_voided_by
  has_many :creators, :through => :patient_names_as_creator
  has_many :patient_names, :through => :patient_names
  has_many :patients, :through => :patient_names
  has_many :programs, :through => :patient_programs
  has_many :changed_bies, :through => :patient_programs_as_changed_by
  has_many :patients, :through => :patient_programs
  has_many :patient_programs, :through => :patient_programs
  has_many :voided_bies, :through => :patient_programs_as_voided_by
  has_many :programs, :through => :patient_programs
  has_many :creators, :through => :patient_programs_as_creator
  has_many :patients, :through => :patient_programs
  has_many :patient_programs, :through => :patient_programs
  has_many :voided_bies, :through => :patient_programs_as_voided_by
  has_many :programs, :through => :patient_programs
  has_many :creators, :through => :patient_programs_as_creator
  has_many :changed_bies, :through => :patient_programs_as_changed_by
  has_many :patients, :through => :patient_programs
  has_many :patient_programs, :through => :patient_programs
  has_many :changed_bies, :through => :patient_states_as_changed_by
  has_many :patient_states, :through => :patient_states
  has_many :patient_programs, :through => :patient_states
  has_many :voided_bies, :through => :patient_states_as_voided_by
  has_many :states, :through => :patient_states_as_state
  has_many :creators, :through => :patient_states_as_creator
  has_many :patient_states, :through => :patient_states
  has_many :patient_programs, :through => :patient_states
  has_many :voided_bies, :through => :patient_states_as_voided_by
  has_many :states, :through => :patient_states_as_state
  has_many :creators, :through => :patient_states_as_creator
  has_many :changed_bies, :through => :patient_states_as_changed_by
  has_many :patient_states, :through => :patient_states
  has_many :patient_programs, :through => :patient_states
  has_many :states, :through => :patient_states_as_state
  has_many :patients, :through => :people
  has_many :people, :through => :people
  has_many :programs, :through => :programs
  has_many :concepts, :through => :programs
  has_many :changed_bies, :through => :programs_as_changed_by
  has_many :voided_bies, :through => :programs_as_voided_by
  has_many :programs, :through => :programs
  has_many :concepts, :through => :programs
  has_many :creators, :through => :programs_as_creator
  has_many :voided_bies, :through => :programs_as_voided_by
  has_many :programs, :through => :programs
  has_many :concepts, :through => :programs
  has_many :creators, :through => :programs_as_creator
  has_many :changed_bies, :through => :programs_as_changed_by
  has_many :concepts, :through => :program_workflows
  has_many :programs, :through => :program_workflows
  has_many :program_workflows, :through => :program_workflows
  has_many :voided_bies, :through => :program_workflows_as_voided_by
  has_many :concepts, :through => :program_workflows
  has_many :programs, :through => :program_workflows
  has_many :creators, :through => :program_workflows_as_creator
  has_many :program_workflows, :through => :program_workflows
  has_many :concepts, :through => :program_workflow_states
  has_many :program_workflow_states, :through => :program_workflow_states
  has_many :program_workflows, :through => :program_workflow_states
  has_many :voided_bies, :through => :program_workflow_states_as_voided_by
  has_many :concepts, :through => :program_workflow_states
  has_many :creators, :through => :program_workflow_states_as_creator
  has_many :program_workflow_states, :through => :program_workflow_states
  has_many :program_workflows, :through => :program_workflow_states
  has_many :relatives, :through => :relationships_as_relative
  has_many :relationships, :through => :relationships
  has_many :relationships, :through => :relationships_as_relationship
  has_many :voided_bies, :through => :relationships_as_voided_by
  has_many :people, :through => :relationships
  has_many :creators, :through => :relationships_as_creator
  has_many :relatives, :through => :relationships_as_relative
  has_many :relationships, :through => :relationships
  has_many :relationships, :through => :relationships_as_relationship
  has_many :people, :through => :relationships
  has_many :relationship_types, :through => :relationship_types
  has_many :changed_bies, :through => :reports_as_changed_by
  has_many :reports, :through => :reports
  has_many :voided_bies, :through => :reports_as_voided_by
  has_many :creators, :through => :reports_as_creator
  has_many :reports, :through => :reports
  has_many :voided_bies, :through => :reports_as_voided_by
  has_many :creators, :through => :reports_as_creator
  has_many :changed_bies, :through => :reports_as_changed_by
  has_many :reports, :through => :reports
  has_many :changed_bies, :through => :report_objects_as_changed_by
  has_many :voided_bies, :through => :report_objects_as_voided_by
  has_many :report_objects, :through => :report_objects
  has_many :creators, :through => :report_objects_as_creator
  has_many :voided_bies, :through => :report_objects_as_voided_by
  has_many :report_objects, :through => :report_objects
  has_many :creators, :through => :report_objects_as_creator
  has_many :changed_bies, :through => :report_objects_as_changed_by
  has_many :report_objects, :through => :report_objects
  has_many :created_bies, :through => :scheduler_task_configs_as_created_by
  has_many :changed_bies, :through => :scheduler_task_configs_as_changed_by
  has_many :changed_bies, :through => :users_as_changed_by
  has_many :voided_bies, :through => :users_as_voided_by
  has_many :users, :through => :users
  has_many :creators, :through => :users_as_creator
  has_many :voided_bies, :through => :users_as_voided_by
  has_many :users, :through => :users
  has_many :creators, :through => :users_as_creator
  has_many :changed_bies, :through => :users_as_changed_by
  has_many :users, :through => :users
  has_many :creators, :through => :users_as_creator
  has_many :changed_bies, :through => :users_as_changed_by
  has_many :voided_bies, :through => :users_as_voided_by
  has_many :roles, :through => :user_roles
  validates_length_of :username, :allow_nil => true, :maximum => 50
  validates_length_of :first_name, :allow_nil => true, :maximum => 50
  validates_length_of :middle_name, :allow_nil => true, :maximum => 50
  validates_length_of :last_name, :allow_nil => true, :maximum => 50
  validates_length_of :password, :allow_nil => true, :maximum => 50
  validates_length_of :salt, :allow_nil => true, :maximum => 50
  validates_length_of :secret_question, :allow_nil => true, :maximum => 255
  validates_length_of :secret_answer, :allow_nil => true, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
  validates_inclusion_of :voided, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
end
