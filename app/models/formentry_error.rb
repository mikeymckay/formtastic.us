class FormentryError < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :formentry_error, :class_name => 'FormentryError', :foreign_key => :formentry_error_id
  has_many :formentry_errors, :class_name => 'FormentryError', :foreign_key => :formentry_error_id
  has_many :creators, :through => :formentry_errors_as_creator
  validates_presence_of :form_data
  validates_presence_of :error
  validates_length_of :error, :allow_nil => false, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
