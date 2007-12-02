class FieldAttributesController < ApplicationController

  def index
  end

  # POST 
  def create
    form_field = FormField.find(params[:form_field_id])
    if form_field.field_attributes.collect{|fa|fa.field_attribute_type_id}.include? params[:field_attribute_type_id]
      @field_attribute = FieldAttribute.find_by_form_field_id(params[:form_field_id])
    else
      @field_attribute = FieldAttribute.new()
    end
    @field_attribute.form_field_id = params[:form_field_id]
    @field_attribute.field_attribute_type_id = params[:field_attribute][:field_attribute_type_id]
    @field_attribute.value = params[:field_attribute][:value]
    @field_attribute.save!
  end

  # PUT
  def update
    @field_attribute = FieldAttribute.find(params[:id])
    @field_attribute.update_attributes(params[:field_attribute])
  end
end
