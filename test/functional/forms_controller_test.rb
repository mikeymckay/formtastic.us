require File.dirname(__FILE__) + '/../test_helper'
require 'forms_controller'

# Re-raise errors caught by the controller.
class FormsController; def rescue_action(e) raise e end; end

class FormsControllerTest < Test::Unit::TestCase
  fixtures :forms

  def setup
    @controller = FormsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:forms)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_form
    old_count = Form.count
    post :create, :form => { }
    assert_equal old_count+1, Form.count
    
    assert_redirected_to form_path(assigns(:form))
  end

  def test_should_show_form
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_form
    put :update, :id => 1, :form => { }
    assert_redirected_to form_path(assigns(:form))
  end
  
  def test_should_destroy_form
    old_count = Form.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Form.count
    
    assert_redirected_to forms_path
  end
end
