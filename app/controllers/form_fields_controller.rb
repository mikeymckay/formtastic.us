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

  # PUT
  def update
    params[:form_fields].each_with_index { |id,index| FormField.update(id, :field_number => index+1) }
    render :text => "form_fields field_numbers updated"
  end

  # DELETE
  def destroy
    @form_field = FormField.find(params[:id])
    @form_field.destroy
  end
end
