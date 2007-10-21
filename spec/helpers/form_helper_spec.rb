require File.dirname(__FILE__) + '/../spec_helper'

describe FormHelper do
  
  #Delete this example and add some real ones or delete this file
  it "should include the FormHelper" do
    included_modules = self.metaclass.send :included_modules
    included_modules.should include(FormHelper)
  end
  
end
