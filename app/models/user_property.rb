class UserProperty < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => :user_id
  validates_presence_of :property
  validates_length_of :property, :allow_nil => false, :maximum => 100
  validates_presence_of :property_value
  validates_length_of :property_value, :allow_nil => false, :maximum => 255
end
