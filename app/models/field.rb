class Field < ActiveRecord::Base
  include Openmrs
  has_one :concept
end
