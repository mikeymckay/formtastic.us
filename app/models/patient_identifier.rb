class PatientIdentifier < ActiveRecord::Base
  belongs_to :identifier_type, :class_name => 'PatientIdentifierType', :foreign_key => :identifier_type
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :patient, :class_name => 'Patient', :foreign_key => :patient_id
  belongs_to :location, :class_name => 'Location', :foreign_key => :location_id
  validates_presence_of :identifier
  validates_length_of :identifier, :allow_nil => false, :maximum => 50
  validates_presence_of :identifier_type
  validates_numericality_of :identifier_type, :allow_nil => false, :only_integer => true
  validates_presence_of :preferred
  validates_numericality_of :preferred, :allow_nil => false, :only_integer => true
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_inclusion_of :voided, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
end
