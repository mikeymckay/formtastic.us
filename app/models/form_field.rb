class FormField < ActiveRecord::Base
  belongs_to :field
  belongs_to :form
  has_many :field_attributes
end
