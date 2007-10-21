class Ob < ActiveRecord::Base
  belongs_to :value_coded, :class_name => 'Concept', :foreign_key => :value_coded
  belongs_to :value_drug, :class_name => 'Drug', :foreign_key => :value_drug
  belongs_to :encounter, :class_name => 'Encounter', :foreign_key => :encounter_id
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :location, :class_name => 'Location', :foreign_key => :location_id
  belongs_to :order, :class_name => 'Order', :foreign_key => :order_id
  belongs_to :patient, :class_name => 'Patient', :foreign_key => :patient_id
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :obs, :class_name => 'Ob', :foreign_key => :obs_id
  has_many :complex_obs_as_obs, :class_name => 'ComplexOb', :foreign_key => :obs_id
  has_many :concept_proposals_as_obs, :class_name => 'ConceptProposal', :foreign_key => :obs_id
  has_many :notes_as_obs, :class_name => 'Note', :foreign_key => :obs_id
  has_many :obs_as_obs, :class_name => 'Ob', :foreign_key => :obs_id
  has_many :mime_types, :through => :complex_obs
  has_many :encounters, :through => :concept_proposals
  has_many :concepts, :through => :concept_proposals
  has_many :creators, :through => :concept_proposals_as_creator
  has_many :changed_bies, :through => :concept_proposals_as_changed_by
  has_many :concept_proposals, :through => :concept_proposals
  has_many :obs_concepts, :through => :concept_proposals_as_obs_concept
  has_many :encounters, :through => :notes
  has_many :notes, :through => :notes
  has_many :creators, :through => :notes_as_creator
  has_many :changed_bies, :through => :notes_as_changed_by
  has_many :patients, :through => :notes
  has_many :parents, :through => :notes_as_parent
  has_many :concepts, :through => :obs
  has_many :encounters, :through => :obs
  has_many :orders, :through => :obs
  has_many :creators, :through => :obs_as_creator
  has_many :patients, :through => :obs
  has_many :locations, :through => :obs
  has_many :voided_bies, :through => :obs_as_voided_by
  has_many :value_drugs, :through => :obs_as_value_drug
  has_many :value_codeds, :through => :obs_as_value_coded
  validates_presence_of :obs_datetime
  validates_length_of :accession_number, :allow_nil => true, :maximum => 255
  validates_inclusion_of :value_boolean, :in => [true, false], :allow_nil => true, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :value_coded, :allow_nil => true, :only_integer => true
  validates_numericality_of :value_drug, :allow_nil => true, :only_integer => true
  validates_numericality_of :value_numeric, :allow_nil => true
  validates_length_of :value_modifier, :allow_nil => true, :maximum => 2
  validates_length_of :comments, :allow_nil => true, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_inclusion_of :voided, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
end
