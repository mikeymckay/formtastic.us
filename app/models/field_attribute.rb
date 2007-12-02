class FieldAttribute < ActiveRecord::Base
  belongs_to :field_attribute_type
  belongs_to :form_field
#  validates_uniqueness_of :form_field_id, :scope => :field_attribute_type_id
  def name
    self.field_attribute_type.name
  end
end
