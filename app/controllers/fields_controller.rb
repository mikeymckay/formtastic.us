class FieldsController < ApplicationController
  # GET /fields
  # GET /fields.xml
  def index
    @fields = Field.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @fields.to_xml }
    end
  end

  # GET /fields/1
  # GET /fields/1.xml
  def show
    @field = Field.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @field.to_xml }
    end
  end

  # GET /fields/new
  def new
    @field = Field.new
  end

  # GET /fields/1;edit
  def edit
    @field = Field.find(params[:id])
  end

  # POST /fields
  # POST /fields.xml
  def create
    @field = Field.new(params[:field])

    respond_to do |format|
      if @field.save
        flash[:notice] = 'Field was successfully created.'
        format.html { redirect_to field_url(@field) }
        format.xml  { head :created, :location => field_url(@field) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @field.errors.to_xml }
      end
    end
  end

  # PUT /fields/1
  # PUT /fields/1.xml
  def update
    @field = Field.find(params[:id])

    respond_to do |format|
      if @field.update_attributes(params[:field])
        flash[:notice] = 'Field was successfully updated.'
        format.html { redirect_to field_url(@field) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @field.errors.to_xml }
      end
    end
  end

  # DELETE /fields/1
  # DELETE /fields/1.xml
  def destroy
    @field = Field.find(params[:id])
    @field.destroy

    respond_to do |format|
      format.html { redirect_to fields_url }
      format.xml  { head :ok }
    end
  end
end
