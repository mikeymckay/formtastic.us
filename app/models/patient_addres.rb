class PatientAddres < ActiveRecord::Base
  belongs_to :patient, :class_name => 'Patient', :foreign_key => :patient_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :patient_address, :class_name => 'PatientAddres', :foreign_key => :patient_address_id
  has_many :patient_addresses_as_patient_address, :class_name => 'PatientAddres', :foreign_key => :patient_address_id
  has_many :creators, :through => :patient_addresses_as_creator
  has_many :patients, :through => :patient_addresses
  has_many :voided_bies, :through => :patient_addresses_as_voided_by
  validates_inclusion_of :preferred, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
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
  validates_inclusion_of :voided, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
end
