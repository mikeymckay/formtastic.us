class Hl7Source < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :hl7_source, :class_name => 'Hl7Source', :foreign_key => :hl7_source_id
  has_many :hl7_in_queues, :class_name => 'Hl7InQueue', :foreign_key => :hl7_source
  has_many :hl7_sources, :class_name => 'Hl7Source', :foreign_key => :hl7_source_id
  has_many :hl7_in_queues, :through => :hl7_in_queues
  has_many :creators, :through => :hl7_sources_as_creator
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
