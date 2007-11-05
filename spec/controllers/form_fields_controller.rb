require File.dirname(__FILE__) + '/../spec_helper'

describe FormFieldsController do

  fixtures :forms, :form_fields, :users, :locations

  before(:each) do
    User.current_user = users(:clinician)
    Location.current_location = locations(:balaka)
  end

  it "should return some javascript on a POST to create" do
    post :create, :form_id => 1, :field => {:id => 1}
  end

end
