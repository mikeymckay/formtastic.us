class ReportObject < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :changed_by, :class_name => 'User', :foreign_key => :changed_by
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :report_object, :class_name => 'ReportObject', :foreign_key => :report_object_id
  has_many :report_objects, :class_name => 'ReportObject', :foreign_key => :report_object_id
  has_many :creators, :through => :report_objects_as_creator
  has_many :changed_bies, :through => :report_objects_as_changed_by
  has_many :voided_bies, :through => :report_objects_as_voided_by
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_length_of :description, :allow_nil => true, :maximum => 1000
  validates_presence_of :report_object_type
  validates_length_of :report_object_type, :allow_nil => false, :maximum => 255
  validates_presence_of :report_object_sub_type
  validates_length_of :report_object_sub_type, :allow_nil => false, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
  validates_inclusion_of :voided, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
end
