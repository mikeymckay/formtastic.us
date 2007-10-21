class DrugOrder < ActiveRecord::Base
  belongs_to :order, :class_name => 'Order', :foreign_key => :order_id
  belongs_to :drug_inventory, :class_name => 'Drug', :foreign_key => :drug_inventory_id
  belongs_to :drug_order, :class_name => 'DrugOrder', :foreign_key => :drug_order_id
  has_many :drug_orders, :class_name => 'DrugOrder', :foreign_key => :drug_order_id
  has_many :drug_inventories, :through => :drug_orders_as_drug_inventory
  has_many :orders, :through => :drug_orders
  validates_numericality_of :dose, :allow_nil => true, :only_integer => true
  validates_length_of :units, :allow_nil => true, :maximum => 255
  validates_length_of :frequency, :allow_nil => true, :maximum => 255
  validates_inclusion_of :prn, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_inclusion_of :complex, :in => [true, false], :allow_nil => false, :message => ActiveRecord::Errors.default_error_messages[:blank]
  validates_numericality_of :quantity, :allow_nil => true, :only_integer => true
end
