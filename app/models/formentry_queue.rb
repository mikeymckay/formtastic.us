class FormentryQueue < ActiveRecord::Base
  belongs_to :formentry_queue, :class_name => 'FormentryQueue', :foreign_key => :formentry_queue_id
  has_many :formentry_queues, :class_name => 'FormentryQueue', :foreign_key => :formentry_queue_id
  validates_presence_of :form_data
  validates_presence_of :status
  validates_numericality_of :status, :allow_nil => false, :only_integer => true
  validates_length_of :error_msg, :allow_nil => true, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
