class Order < ActiveRecord::Base
  belongs_to :orderer, :class_name => 'User', :foreign_key => :orderer
  belongs_to :encounter, :class_name => 'Encounter', :foreign_key => :encounter_id
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :order_type, :class_name => 'OrderType', :foreign_key => :order_type_id
  belongs_to :discontinued_by, :class_name => 'User', :foreign_key => :discontinued_by
  belongs_to :voided_by, :class_name => 'User', :foreign_key => :voided_by
  belongs_to :order, :class_name => 'Order', :foreign_key => :order_id
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  has_many :drug_orders, :class_name => 'DrugOrder', :foreign_key => :order_id
  has_many :obs, :class_name => 'Ob', :foreign_key => :order_id
  has_many :orders, :class_name => 'Order', :foreign_key => :order_id
  has_many :drug_inventories, :through => :drug_orders_as_drug_inventory
  has_many :drug_orders, :through => :drug_orders
  has_many :concepts, :through => :obs
  has_many :encounters, :through => :obs
  has_many :creators, :through => :obs_as_creator
  has_many :patients, :through => :obs
  has_many :locations, :through => :obs
  has_many :voided_bies, :through => :obs_as_voided_by
  has_many :value_drugs, :through => :obs_as_value_drug
  has_many :obs, :through => :obs_as_obs
  has_many :value_codeds, :through => :obs_as_value_coded
  has_many :concepts, :through => :orders
  has_many :encounters, :through => :orders
  has_many :creators, :through => :orders_as_creator
  has_many :voided_bies, :through => :orders_as_voided_by
  has_many :discontinued_bies, :through => :orders_as_discontinued_by
  has_many :order_types, :through => :orders
  has_many :orderers, :through => :orders_as_orderer
  validates_numericality_of :orderer, :allow_nil => true, :only_integer => true
  validates_inclusion_of :discontinued, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :discontinued_by, :allow_nil => true, :only_integer => true
  validates_length_of :discontinued_reason, :allow_nil => true, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_inclusion_of :voided, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :voided_by, :allow_nil => true, :only_integer => true
  validates_length_of :void_reason, :allow_nil => true, :maximum => 255
end
