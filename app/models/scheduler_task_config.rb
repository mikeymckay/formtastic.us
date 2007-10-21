class SchedulerTaskConfig < ActiveRecord::Base
  belongs_to :changed_by, :class_name => 'User', :foreign_key => :changed_by
  belongs_to :created_by, :class_name => 'User', :foreign_key => :created_by
  has_many :scheduler_task_config_properties_as_task_config, :class_name => 'SchedulerTaskConfigProperty', :foreign_key => :task_config_id
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_length_of :description, :allow_nil => true, :maximum => 1024
  validates_presence_of :start_time
  validates_length_of :start_time_pattern, :allow_nil => true, :maximum => 50
  validates_presence_of :repeat_interval
  validates_numericality_of :repeat_interval, :allow_nil => false, :only_integer => true
  validates_presence_of :start_on_startup
  validates_numericality_of :start_on_startup, :allow_nil => false, :only_integer => true
  validates_presence_of :started
  validates_numericality_of :started, :allow_nil => false, :only_integer => true
  validates_numericality_of :created_by, :allow_nil => true, :only_integer => true
  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
end
