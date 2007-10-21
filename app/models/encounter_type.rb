class EncounterType < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :encounter_type, :class_name => 'EncounterType', :foreign_key => :encounter_type_id
  has_many :encounters, :class_name => 'Encounter', :foreign_key => :encounter_type
  has_many :encounter_types, :class_name => 'EncounterType', :foreign_key => :encounter_type_id
  has_many :forms, :class_name => 'Form', :foreign_key => :encounter_type
  has_many :encounters, :through => :encounters
  has_many :forms, :through => :encounters
  has_many :creators, :through => :encounters_as_creator
  has_many :providers, :through => :encounters_as_provider
  has_many :patients, :through => :encounters
  has_many :locations, :through => :encounters
  has_many :creators, :through => :encounter_types_as_creator
  has_many :forms, :through => :forms
  has_many :creators, :through => :forms_as_creator
  has_many :retired_bies, :through => :forms_as_retired_by
  has_many :changed_bies, :through => :forms_as_changed_by
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 50
  validates_presence_of :description
  validates_length_of :description, :allow_nil => false, :maximum => 50
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
