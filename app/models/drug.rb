class Drug < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  belongs_to :drug, :class_name => 'Drug', :foreign_key => :drug_id
  has_many :drugs, :class_name => 'Drug', :foreign_key => :drug_id
  has_many :drug_barcodes, :class_name => 'DrugBarcode', :foreign_key => :drug_id
  has_many :drug_orders_as_drug_inventory, :class_name => 'DrugOrder', :foreign_key => :drug_inventory_id
  has_many :obs_as_value_drug, :class_name => 'Ob', :foreign_key => :value_drug
  has_many :concepts, :through => :drugs
  has_many :creators, :through => :drugs_as_creator
  has_many :orders, :through => :drug_orders
  has_many :drug_orders, :through => :drug_orders
  has_many :concepts, :through => :obs
  has_many :encounters, :through => :obs
  has_many :orders, :through => :obs
  has_many :creators, :through => :obs_as_creator
  has_many :patients, :through => :obs
  has_many :locations, :through => :obs
  has_many :voided_bies, :through => :obs_as_voided_by
  has_many :obs, :through => :obs_as_obs
  has_many :value_codeds, :through => :obs_as_value_coded
  validates_length_of :name, :allow_nil => true, :maximum => 50
  validates_inclusion_of :combination, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :daily_mg_per_kg, :allow_nil => true
  validates_length_of :dosage_form, :allow_nil => true, :maximum => 255
  validates_numericality_of :dose_strength, :allow_nil => true
  validates_numericality_of :maximum_dose, :allow_nil => true
  validates_numericality_of :minimum_dose, :allow_nil => true
  validates_length_of :route, :allow_nil => true, :maximum => 255
  validates_numericality_of :shelf_life, :allow_nil => true, :only_integer => true
  validates_numericality_of :therapy_class, :allow_nil => true, :only_integer => true
  validates_length_of :units, :allow_nil => true, :maximum => 50
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
