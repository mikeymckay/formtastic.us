class PaperMastercard < ActiveRecord::Base
  validates_presence_of :arvnumber
  validates_length_of :arvnumber, :allow_nil => false, :maximum => 50
  validates_presence_of :fieldid
  validates_length_of :fieldid, :allow_nil => false, :maximum => 100
  validates_presence_of :fieldvalue
  validates_length_of :fieldvalue, :allow_nil => false, :maximum => 100
  validates_presence_of :entry
  validates_length_of :entry, :allow_nil => false, :maximum => 1
  validates_numericality_of :mastercard_number, :allow_nil => true, :only_integer => true
  validates_length_of :username, :allow_nil => true, :maximum => 20
end
