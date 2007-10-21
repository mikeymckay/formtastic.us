class FieldAnswer < ActiveRecord::Base
  belongs_to :field, :class_name => 'Field', :foreign_key => :field_id
  belongs_to :answer, :class_name => 'Concept', :foreign_key => :answer_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
