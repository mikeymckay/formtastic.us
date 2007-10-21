class OrderType < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :order_type, :class_name => 'OrderType', :foreign_key => :order_type_id
  has_many :orders, :class_name => 'Order', :foreign_key => :order_type_id
  has_many :order_types, :class_name => 'OrderType', :foreign_key => :order_type_id
  has_many :concepts, :through => :orders
  has_many :encounters, :through => :orders
  has_many :orders, :through => :orders
  has_many :creators, :through => :orders_as_creator
  has_many :voided_bies, :through => :orders_as_voided_by
  has_many :discontinued_bies, :through => :orders_as_discontinued_by
  has_many :orderers, :through => :orders_as_orderer
  has_many :creators, :through => :order_types_as_creator
  validates_presence_of :name
  validates_length_of :name, :allow_nil => false, :maximum => 255
  validates_presence_of :description
  validates_length_of :description, :allow_nil => false, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
end
