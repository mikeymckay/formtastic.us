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

end
