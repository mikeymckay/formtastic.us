class PatientIdentifierType < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :patient_identifier_type, :class_name => 'PatientIdentifierType', :foreign_key => :patient_identifier_type_id
  has_many :patient_identifiers_as_identifier_type, :class_name => 'PatientIdentifier', :foreign_key => :identifier_type
  has_many :patient_identifier_types, :class_name => 'PatientIdentifierType', :foreign_key => :patient_identifier_type_id
  has_many :creators, :through => :patient_identifiers_as_creator
  has_many :patients, :through => :patient_identifiers
  has_many :locations, :through => :patient_identifiers
  has_many :voided_bies, :through => :patient_identifiers_as_voided_by
  has_many :creators, :through => :patient_identifier_types_as_creator
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 50
  validates_presence_of :description
  validates_length_of :format, :allow_nil => true, :maximum => 50
  validates_inclusion_of :check_digit, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
