class FormsController < ApplicationController
  # GET /forms
  # GET /forms.xml
  def index
    @forms = Form.find(:all)

#    respond_to do |format|
#      format.html # index.rhtml
#      format.xml  { render :xml => @forms.to_xml }
#    end
  end

  # GET /forms/1
  # GET /forms/1.xml
  def show
    @form = Form.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @form.to_xml }
    end
  end

  # GET /forms/new
  def new
    @form = Form.new
  end

  # GET /forms/1;edit
  def edit
    @form = Form.find(params[:id])
  end

  # POST /forms
  # POST /forms.xml
  def create
    @form = Form.new(params[:form])

    respond_to do |format|
      if @form.save
        flash[:notice] = 'Form was successfully created.'
        format.html { redirect_to form_url(@form) }
        format.xml  { head :created, :location => form_url(@form) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @form.errors.to_xml }
      end
    end
  end

  # PUT /forms/1
  # PUT /forms/1.xml
  def update
    @form = Form.find(params[:id])
    @form.update_attributes(params[:form])
  end

  # DELETE /forms/1
  # DELETE /forms/1.xml
  def destroy
    @form = Form.find(params[:id])
    @form.destroy

    respond_to do |format|
      format.html { redirect_to forms_url }
      format.xml  { head :ok }
    end
  end
end
