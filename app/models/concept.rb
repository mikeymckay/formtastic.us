class Concept < ActiveRecord::Base
  include Openmrs

  def self.max
    return 190
  end

end
