require File.dirname(__FILE__) + '/../spec_helper'

describe FormsController do

 before(:each) do
    @form = mock("form")
    Form.stub!(:new).and_return(@form)
    Form.stub!("find").and_return(@form)
  end

  it "should list all forms on GET to index" do
    @forms = [@form]
    Form.stub!("find").and_return(@forms)
    get 'index'
    assigns[:forms].should equal(@forms)
    response.should render_template("forms/index")
    response.should_not be_redirect
  end

  it "should find a form on GET to show" do
    get 'show'
    assigns[:form].should equal(@form)
  end

  it "should create a new unsaved form on GET to new" do
    get 'new'
    assigns[:form].should equal(@form)
  end

  it "should find the right form and form_fields on GET to edit" do
    @form_fields = mock("form_fields")
    @form_fields.should_receive(:sort_by).and_return(@form_fields)
    @form.should_receive(:form_fields).and_return(@form_fields)
    get 'edit'
    assigns[:form].should equal(@form)
    assigns[:form_fields].should equal(@form_fields)
  end

  it "should create a new form based on params on POST to create" do
    @form.should_receive(:save).and_return(true)
    post 'create', {:form => {:name => "form_name"}}
    assigns[:form].should equal(@form)
  end

  it "should update an existing form based on params on PUT to update" do
    @form.should_receive(:update_attributes).and_return(true)
    put 'update', {:form => {:name => "form_name"}}
    assigns[:form].should equal(@form)
  end

  it "should destroy an existing form based on params on DELETE to destroy" do
    @form.should_receive(:update_attributes).and_return(true)
    post 'update', {:form => {:name => "form_name"}}
    assigns[:form].should equal(@form)
    response.should be_redirect
  end
end
