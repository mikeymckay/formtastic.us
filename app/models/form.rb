class Form < ActiveRecord::Base
  belongs_to :encounter_type, :class_name => 'EncounterType', :foreign_key => :encounter_type
  has_many :form_fields
  has_many :fields, :through => :form_fields
end
