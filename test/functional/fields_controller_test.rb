require File.dirname(__FILE__) + '/../test_helper'
require 'fields_controller'

# Re-raise errors caught by the controller.
class FieldsController; def rescue_action(e) raise e end; end

class FieldsControllerTest < Test::Unit::TestCase
  fixtures :fields

  def setup
    @controller = FieldsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:fields)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_field
    old_count = Field.count
    post :create, :field => { }
    assert_equal old_count+1, Field.count
    
    assert_redirected_to field_path(assigns(:field))
  end

  def test_should_show_field
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_field
    put :update, :id => 1, :field => { }
    assert_redirected_to field_path(assigns(:field))
  end
  
  def test_should_destroy_field
    old_count = Field.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Field.count
    
    assert_redirected_to fields_path
  end
end
