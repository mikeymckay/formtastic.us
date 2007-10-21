class Hl7InError < ActiveRecord::Base
  belongs_to :hl7_in_error, :class_name => 'Hl7InError', :foreign_key => :hl7_in_error_id
  has_many :hl7_in_errors, :class_name => 'Hl7InError', :foreign_key => :hl7_in_error_id
  validates_presence_of :hl7_source
  validates_numericality_of :hl7_source, :allow_nil => false, :only_integer => true
  validates_presence_of :hl7_data
  validates_presence_of :error
  validates_length_of :error, :allow_nil => false, :maximum => 255
  validates_presence_of :date_created
end
