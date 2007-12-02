class ConceptsController < ApplicationController

  # This whole controller can be wiped out - just needed something to test
  
  def get
    cities = "Reno Lilongwe Blantyre Nairobi Boston Geneva".split(" ")
    matches = cities.collect{|city|city if city.match(/#{params[:searchString]}/i)}.compact
    render :text => "<ul><li>" + matches.join("</li><li>") + "</li></ul>"
  end

end
