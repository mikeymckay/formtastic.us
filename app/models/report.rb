class Report < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :changed_by, :class_name => 'User', :foreign_key => :changed_by
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :report, :class_name => 'Report', :foreign_key => :report_id
  has_many :reports, :class_name => 'Report', :foreign_key => :report_id
  has_many :creators, :through => :reports_as_creator
  has_many :changed_bies, :through => :reports_as_changed_by
  has_many :voided_bies, :through => :reports_as_voided_by
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
  validates_inclusion_of :voided, :in => [true, false], :allow_nil => true, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
end
