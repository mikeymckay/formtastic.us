class DrugBarcode < ActiveRecord::Base
  belongs_to :drug, :class_name => 'Drug', :foreign_key => :drug_id
  validates_presence_of :barcode
  validates_length_of :barcode, :allow_nil => false, :maximum => 16
  validates_numericality_of :quantity, :allow_nil => true, :only_integer => true
end
