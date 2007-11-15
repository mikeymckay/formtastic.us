class FieldAttributeTypesController < ApplicationController

  def index
    @field_attribute_types = FieldAttributeType.find(:all)
  end


  def show
    redirect_to :action => :index
  end

  def new
    @field_attribute_type = FieldAttributeType.new
  end

  def edit
    @field_attribute_type = FieldAttributeType.find(params[:id])
  end

  def create
    @field_attribute_type = FieldAttributeType.new(params[:field_attribute_type])
    respond_to do |format|
      if @field_attribute_type.save
        flash[:notice] = 'FieldAttributeType was successfully created.'
        format.html { redirect_to field_attribute_type_url(@field_attribute_type) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @field_attribute_type = FieldAttributeType.find(params[:id])

    respond_to do |format|
      if @field_attribute_type.update_attributes(params[:field_attribute_type])
        flash[:notice] = 'Form was successfully updated.'
        format.html { redirect_to field_attribute_type_url(@field_attribute_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @field_attribute_type.errors.to_xml }
      end
    end
  end

end
