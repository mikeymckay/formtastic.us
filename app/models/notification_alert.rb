class NotificationAlert < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :changed_by, :class_name => 'User', :foreign_key => :changed_by
  has_many :notification_alert_recipients_as_alert, :class_name => 'NotificationAlertRecipient', :foreign_key => :alert_id
  has_many :users, :through => :notification_alert_recipients
  validates_presence_of :text
  validates_length_of :text, :allow_nil => false, :maximum => 512
  validates_presence_of :satisfied_by_any
  validates_numericality_of :satisfied_by_any, :allow_nil => false, :only_integer => true
  validates_presence_of :alert_read
  validates_numericality_of :alert_read, :allow_nil => false, :only_integer => true
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
end
