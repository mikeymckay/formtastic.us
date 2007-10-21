class NotificationAlertRecipient < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => :user_id
  belongs_to :alert, :class_name => 'NotificationAlert', :foreign_key => :alert_id
  validates_presence_of :alert_read
  validates_numericality_of :alert_read, :allow_nil => false, :only_integer => true
end
