require File.dirname(__FILE__) + '/../spec_helper'

describe Form do
  fixtures :users  
  fixtures :form_fields
  before(:each) do
    @form = Form.new
    @form.name = "form_name"
    @form.creator = users(:clinician)
    @form.date_created = Date.today
    @form.version = "1"
  end

  it "should be valid" do
    @form.should be_valid
  end

  it "should be able to take form_fields" do
    puts FormField.find(1)
    form_fields = [form_fields(:first_name), form_fields(:weight)] 
    @form.form_fields = form_fields
    @form.form_fields.should == form_fields
  end

end
