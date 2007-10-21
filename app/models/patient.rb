class Patient < ActiveRecord::Base
  belongs_to :tribe, :class_name => 'Tribe', :foreign_key => :tribe
  belongs_to :changed_by, :class_name => 'User', :foreign_key => :changed_by
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :patient, :class_name => 'Patient', :foreign_key => :patient_id
  has_many :encounters, :class_name => 'Encounter', :foreign_key => :patient_id
  has_many :notes, :class_name => 'Note', :foreign_key => :patient_id
  has_many :obs, :class_name => 'Ob', :foreign_key => :patient_id
  has_many :patients, :class_name => 'Patient', :foreign_key => :patient_id
  has_many :patient_addresses, :class_name => 'PatientAddres', :foreign_key => :patient_id
  has_many :patient_identifiers, :class_name => 'PatientIdentifier', :foreign_key => :patient_id
  has_many :patient_names, :class_name => 'PatientName', :foreign_key => :patient_id
  has_many :patient_programs, :class_name => 'PatientProgram', :foreign_key => :patient_id
  has_many :people, :class_name => 'Person', :foreign_key => :patient_id
  has_many :encounters, :through => :encounters
  has_many :forms, :through => :encounters
  has_many :creators, :through => :encounters_as_creator
  has_many :providers, :through => :encounters_as_provider
  has_many :locations, :through => :encounters
  has_many :encounter_types, :through => :encounters
  has_many :encounters, :through => :notes
  has_many :notes, :through => :notes
  has_many :creators, :through => :notes_as_creator
  has_many :changed_bies, :through => :notes_as_changed_by
  has_many :obs, :through => :notes_as_obs
  has_many :parents, :through => :notes_as_parent
  has_many :concepts, :through => :obs
  has_many :encounters, :through => :obs
  has_many :orders, :through => :obs
  has_many :creators, :through => :obs_as_creator
  has_many :locations, :through => :obs
  has_many :voided_bies, :through => :obs_as_voided_by
  has_many :value_drugs, :through => :obs_as_value_drug
  has_many :obs, :through => :obs_as_obs
  has_many :value_codeds, :through => :obs_as_value_coded
  has_many :creators, :through => :patients_as_creator
  has_many :changed_bies, :through => :patients_as_changed_by
  has_many :voided_bies, :through => :patients_as_voided_by
  has_many :tribes, :through => :patients
  has_many :patient_addresses, :through => :patient_addresses_as_patient_address
  has_many :creators, :through => :patient_addresses_as_creator
  has_many :voided_bies, :through => :patient_addresses_as_voided_by
  has_many :creators, :through => :patient_identifiers_as_creator
  has_many :locations, :through => :patient_identifiers
  has_many :identifier_types, :through => :patient_identifiers_as_identifier_type
  has_many :voided_bies, :through => :patient_identifiers_as_voided_by
  has_many :creators, :through => :patient_names_as_creator
  has_many :patient_names, :through => :patient_names
  has_many :voided_bies, :through => :patient_names_as_voided_by
  has_many :programs, :through => :patient_programs
  has_many :creators, :through => :patient_programs_as_creator
  has_many :changed_bies, :through => :patient_programs_as_changed_by
  has_many :patient_programs, :through => :patient_programs
  has_many :voided_bies, :through => :patient_programs_as_voided_by
  has_many :users, :through => :people
  has_many :people, :through => :people
  validates_presence_of :gender
  validates_length_of :gender, :allow_nil => false, :maximum => 50
  validates_length_of :race, :allow_nil => true, :maximum => 50
  validates_inclusion_of :birthdate_estimated, :in => [true, false], :allow_nil => true, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_length_of :birthplace, :allow_nil => true, :maximum => 50
  validates_numericality_of :tribe, :allow_nil => true, :only_integer => true
  validates_length_of :citizenship, :allow_nil => true, :maximum => 50
  validates_length_of :mothers_name, :allow_nil => true, :maximum => 50
  validates_numericality_of :civil_status, :allow_nil => true, :only_integer => true
  validates_presence_of :dead
  validates_numericality_of :dead, :allow_nil => false, :only_integer => true
  validates_length_of :cause_of_death, :allow_nil => true, :maximum => 255
  validates_length_of :health_district, :allow_nil => true, :maximum => 255
  validates_numericality_of :health_center, :allow_nil => true, :only_integer => true
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
  validates_inclusion_of :voided, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
end
