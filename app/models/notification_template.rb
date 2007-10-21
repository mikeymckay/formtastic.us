class NotificationTemplate < ActiveRecord::Base
  validates_length_of :name, :allow_nil => true, :maximum => 50
  validates_length_of :subject, :allow_nil => true, :maximum => 100
  validates_length_of :sender, :allow_nil => true, :maximum => 255
  validates_length_of :recipients, :allow_nil => true, :maximum => 512
  validates_numericality_of :ordinal, :allow_nil => true, :only_integer => true
end
