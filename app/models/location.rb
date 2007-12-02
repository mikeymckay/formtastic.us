class Location < ActiveRecord::Base

  cattr_accessor :current_location

  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :location, :class_name => 'Location', :foreign_key => :location_id
  has_many :encounters, :class_name => 'Encounter', :foreign_key => :location_id
  has_many :locations, :class_name => 'Location', :foreign_key => :location_id
  has_many :obs, :class_name => 'Ob', :foreign_key => :location_id
  has_many :patient_identifiers, :class_name => 'PatientIdentifier', :foreign_key => :location_id
  has_many :encounters, :through => :encounters
  has_many :forms, :through => :encounters
  has_many :creators, :through => :encounters_as_creator
  has_many :providers, :through => :encounters_as_provider
  has_many :patients, :through => :encounters
  has_many :encounter_types, :through => :encounters
  has_many :creators, :through => :locations_as_creator
  has_many :concepts, :through => :obs
  has_many :encounters, :through => :obs
  has_many :orders, :through => :obs
  has_many :creators, :through => :obs_as_creator
  has_many :patients, :through => :obs
  has_many :voided_bies, :through => :obs_as_voided_by
  has_many :value_drugs, :through => :obs_as_value_drug
  has_many :obs, :through => :obs_as_obs
  has_many :value_codeds, :through => :obs_as_value_coded
  has_many :creators, :through => :patient_identifiers_as_creator
  has_many :patients, :through => :patient_identifiers
  has_many :identifier_types, :through => :patient_identifiers_as_identifier_type
  has_many :voided_bies, :through => :patient_identifiers_as_voided_by
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_length_of :description, :allow_nil => true, :maximum => 255
  validates_length_of :address1, :allow_nil => true, :maximum => 50
  validates_length_of :address2, :allow_nil => true, :maximum => 50
  validates_length_of :city_village, :allow_nil => true, :maximum => 50
  validates_length_of :state_province, :allow_nil => true, :maximum => 50
  validates_length_of :postal_code, :allow_nil => true, :maximum => 50
  validates_length_of :country, :allow_nil => true, :maximum => 50
  validates_length_of :latitude, :allow_nil => true, :maximum => 50
  validates_length_of :longitude, :allow_nil => true, :maximum => 50
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
