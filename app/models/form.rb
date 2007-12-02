class Form < ActiveRecord::Base
  include Openmrs
  belongs_to :encounter_type, :class_name => 'EncounterType', :foreign_key => :encounter_type
  has_many :form_fields, :dependent => :delete_all
  has_many :fields, :through => :form_fields

  def form_fields_sorted
    return self.form_fields.sort_by{|form_field| form_field.field_number|| form_field.id}
  end
end
