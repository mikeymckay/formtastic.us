class Hl7InQueue < ActiveRecord::Base
  belongs_to :hl7_source, :class_name => 'Hl7Source', :foreign_key => :hl7_source
  belongs_to :hl7_in_queue, :class_name => 'Hl7InQueue', :foreign_key => :hl7_in_queue_id
  has_many :hl7_in_queues, :class_name => 'Hl7InQueue', :foreign_key => :hl7_in_queue_id
  has_many :hl7_sources, :through => :hl7_in_queues
  validates_presence_of :hl7_source
  validates_numericality_of :hl7_source, :allow_nil => false, :only_integer => true
  validates_presence_of :hl7_data
  validates_presence_of :state
  validates_numericality_of :state, :allow_nil => false, :only_integer => true
end
