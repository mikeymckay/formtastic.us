class GlobalProperty < ActiveRecord::Base
  validates_length_of :property, :allow_nil => true, :maximum => 255
  validates_length_of :property_value, :allow_nil => true, :maximum => 255
end
