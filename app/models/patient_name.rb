class PatientName < ActiveRecord::Base
  belongs_to :patient, :class_name => 'Patient', :foreign_key => :patient_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :patient_name, :class_name => 'PatientName', :foreign_key => :patient_name_id
  has_many :patient_names, :class_name => 'PatientName', :foreign_key => :patient_name_id
  has_many :creators, :through => :patient_names_as_creator
  has_many :patients, :through => :patient_names
  has_many :voided_bies, :through => :patient_names_as_voided_by
  validates_inclusion_of :preferred, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_length_of :prefix, :allow_nil => true, :maximum => 50
  validates_length_of :given_name, :allow_nil => true, :maximum => 50
  validates_length_of :middle_name, :allow_nil => true, :maximum => 50
  validates_length_of :family_name_prefix, :allow_nil => true, :maximum => 50
  validates_length_of :family_name, :allow_nil => true, :maximum => 50
  validates_length_of :family_name2, :allow_nil => true, :maximum => 50
  validates_length_of :family_name_suffix, :allow_nil => true, :maximum => 50
  validates_length_of :degree, :allow_nil => true, :maximum => 50
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_inclusion_of :voided, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
end
