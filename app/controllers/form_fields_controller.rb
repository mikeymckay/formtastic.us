class FormFieldsController < ApplicationController

  def index
  end

  # POST 
  def create
    @form_field = FormField.new()
    @form_field.form_id = params[:form_id]
    @form_field.field_id = params[:field][:id]
    @form_field.save!

  end
end
