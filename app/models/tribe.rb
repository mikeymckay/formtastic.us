class Tribe < ActiveRecord::Base
  belongs_to :tribe, :class_name => 'Tribe', :foreign_key => :tribe_id
  has_many :patients, :class_name => 'Patient', :foreign_key => :tribe
  has_many :tribes, :class_name => 'Tribe', :foreign_key => :tribe_id
  has_many :creators, :through => :patients_as_creator
  has_many :changed_bies, :through => :patients_as_changed_by
  has_many :patients, :through => :patients
  has_many :voided_bies, :through => :patients_as_voided_by
  validates_inclusion_of :retired, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 50
end
