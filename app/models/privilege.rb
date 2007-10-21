class Privilege < ActiveRecord::Base
  belongs_to :privilege, :class_name => 'Privilege', :foreign_key => :privilege_id
  has_many :privileges, :class_name => 'Privilege', :foreign_key => :privilege_id
  has_many :role_privileges, :class_name => 'RolePrivilege', :foreign_key => :privilege_id
  has_many :roles, :through => :role_privileges
  validates_presence_of :privilege
  validates_length_of :privilege, :allow_nil => false, :maximum => 50
  validates_presence_of :description
  validates_length_of :description, :allow_nil => false, :maximum => 250
end
