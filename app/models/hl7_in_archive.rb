class Hl7InArchive < ActiveRecord::Base
  belongs_to :hl7_in_archive, :class_name => 'Hl7InArchive', :foreign_key => :hl7_in_archive_id
  has_many :hl7_in_archives, :class_name => 'Hl7InArchive', :foreign_key => :hl7_in_archive_id
  validates_presence_of :hl7_source
  validates_numericality_of :hl7_source, :allow_nil => false, :only_integer => true
  validates_length_of :hl7_source_key, :allow_nil => true, :maximum => 255
  validates_presence_of :hl7_data
  validates_presence_of :date_created
end
