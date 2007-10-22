require File.dirname(__FILE__) + '/../../spec_helper'

describe "/forms/" do
  before(:each) do
    @height_weight = mock_model(Form)
    @reception = mock_model(Form)
    @height_weight.stub!(:name).and_return("Height/Weight")
    @reception.stub!(:name).and_return("HIV Reception")
    assigns[:forms] = [ @height_weight, @reception]
  end

  it "should display the list of forms with a link to show, edit and delete each one" do
    render "/forms/index.rhtml"
    response.should have_tag('td') do
      with_tag('a', 'Height/Weight')
      with_tag('a', 'HIV Reception')
    end
  end
end

describe "editing a form" do
  before(:each) do
    @height_weight = mock_model(Form)
    assigns[:form] = @height_weight
    @height_weight.stub!(:name).and_return("Height/Weight")

    @weight_field = mock_model(Field)
    @weight_field.stub!(:type).and_return("Number")
    @weight_field.stub!(:name).and_return("Weight")

    @weight_form_field = mock_model(FormField)
    assigns[:form_fields] = [@weight_form_field]
    @weight_form_field.stub!(:field).and_return(@weight_field)

    @min = mock_model(FieldAttribute)
    @min.stub!(:name).and_return("Min")
    @weight_form_field.stub!(:field_attributes).and_return([@min])

    assigns[:available_fields] = [@weight_field]

  end

  it "should display the form's name" do
    render "/forms/edit"
    response.should have_tag('h1', "Height/Weight")
  end

  it "should display the field type and names in the form" do
    render "/forms/edit"

    response.should have_tag('li.fields') do
       with_tag("span.name", "Weight")
       with_tag("span.type", "Number")
       with_tag("select.add_attribute") do
        with_tag("option", "Min")
       end
    end
  end

  it "should have a drop down to add new fields to the form" do
    render "/forms/edit"
    response.should have_tag('select.add_field') do
      with_tag("option", "Weight")
    end
  end
end
