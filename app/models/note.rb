class Note < ActiveRecord::Base
  belongs_to :encounter, :class_name => 'Encounter', :foreign_key => :encounter_id
  belongs_to :parent, :class_name => 'Note', :foreign_key => :parent
  belongs_to :obs, :class_name => 'Ob', :foreign_key => :obs_id
  belongs_to :patient, :class_name => 'Patient', :foreign_key => :patient_id
  belongs_to :changed_by, :class_name => 'User', :foreign_key => :changed_by
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :note, :class_name => 'Note', :foreign_key => :note_id
  has_many :notes_as_parent, :class_name => 'Note', :foreign_key => :parent
  has_many :notes, :class_name => 'Note', :foreign_key => :note_id
  has_many :encounters, :through => :notes
  has_many :creators, :through => :notes_as_creator
  has_many :changed_bies, :through => :notes_as_changed_by
  has_many :patients, :through => :notes
  has_many :obs, :through => :notes_as_obs
  has_many :parents, :through => :notes_as_parent
  has_many :encounters, :through => :notes
  has_many :notes, :through => :notes
  has_many :creators, :through => :notes_as_creator
  has_many :changed_bies, :through => :notes_as_changed_by
  has_many :patients, :through => :notes
  has_many :obs, :through => :notes_as_obs
  validates_length_of :note_type, :allow_nil => true, :maximum => 50
  validates_presence_of :text
  validates_numericality_of :priority, :allow_nil => true, :only_integer => true
  validates_numericality_of :parent, :allow_nil => true, :only_integer => true
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
end
