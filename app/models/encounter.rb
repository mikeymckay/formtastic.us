class Encounter < ActiveRecord::Base
  belongs_to :form, :class_name => 'Form', :foreign_key => :form_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :location, :class_name => 'Location', :foreign_key => :location_id
  belongs_to :patient, :class_name => 'Patient', :foreign_key => :patient_id
  belongs_to :provider, :class_name => 'User', :foreign_key => :provider_id
  belongs_to :encounter_type, :class_name => 'EncounterType', :foreign_key => :encounter_type
  belongs_to :encounter, :class_name => 'Encounter', :foreign_key => :encounter_id
  has_many :concept_proposals, :class_name => 'ConceptProposal', :foreign_key => :encounter_id
  has_many :encounters, :class_name => 'Encounter', :foreign_key => :encounter_id
  has_many :notes, :class_name => 'Note', :foreign_key => :encounter_id
  has_many :obs, :class_name => 'Ob', :foreign_key => :encounter_id
  has_many :orders, :class_name => 'Order', :foreign_key => :encounter_id
  has_many :concepts, :through => :concept_proposals
  has_many :creators, :through => :concept_proposals_as_creator
  has_many :changed_bies, :through => :concept_proposals_as_changed_by
  has_many :concept_proposals, :through => :concept_proposals
  has_many :obs, :through => :concept_proposals_as_obs
  has_many :obs_concepts, :through => :concept_proposals_as_obs_concept
  has_many :forms, :through => :encounters
  has_many :creators, :through => :encounters_as_creator
  has_many :providers, :through => :encounters_as_provider
  has_many :patients, :through => :encounters
  has_many :locations, :through => :encounters
  has_many :encounter_types, :through => :encounters
  has_many :notes, :through => :notes
  has_many :creators, :through => :notes_as_creator
  has_many :changed_bies, :through => :notes_as_changed_by
  has_many :patients, :through => :notes
  has_many :obs, :through => :notes_as_obs
  has_many :parents, :through => :notes_as_parent
  has_many :concepts, :through => :obs
  has_many :orders, :through => :obs
  has_many :creators, :through => :obs_as_creator
  has_many :patients, :through => :obs
  has_many :locations, :through => :obs
  has_many :voided_bies, :through => :obs_as_voided_by
  has_many :value_drugs, :through => :obs_as_value_drug
  has_many :obs, :through => :obs_as_obs
  has_many :value_codeds, :through => :obs_as_value_coded
  has_many :concepts, :through => :orders
  has_many :orders, :through => :orders
  has_many :creators, :through => :orders_as_creator
  has_many :voided_bies, :through => :orders_as_voided_by
  has_many :discontinued_bies, :through => :orders_as_discontinued_by
  has_many :order_types, :through => :orders
  has_many :orderers, :through => :orders_as_orderer
  validates_numericality_of :encounter_type, :allow_nil => true, :only_integer => true
  validates_presence_of :encounter_datetime
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
