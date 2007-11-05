class FieldAttributesController < ApplicationController

  def index
  end

  # POST 
  def create
    @field_attribute = FieldAttribute.new()
    @field_attribute.form_field_id = params[:form_field_id]
    @field_attribute.field_attribute_type_id = params[:field_attribute][:field_attribute_type_id]
    @field_attribute.value = params[:field_attribute][:value]
    @field_attribute.save!
  end
end
