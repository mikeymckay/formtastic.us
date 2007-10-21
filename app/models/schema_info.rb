class SchemaInfo < ActiveRecord::Base
  validates_numericality_of :version, :allow_nil => true, :only_integer => true
end
