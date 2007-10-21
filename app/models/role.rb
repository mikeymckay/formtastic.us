class Role < ActiveRecord::Base
  belongs_to :role, :class_name => 'Role', :foreign_key => :role_id
  has_many :roles, :class_name => 'Role', :foreign_key => :role_id
  has_many :role_privileges, :class_name => 'RolePrivilege', :foreign_key => :role_id
  has_many :role_roles_as_child_role, :class_name => 'RoleRole', :foreign_key => :child_role_id
  has_many :role_roles_as_parent_role, :class_name => 'RoleRole', :foreign_key => :parent_role_id
  has_many :user_roles, :class_name => 'UserRole', :foreign_key => :role_id
  has_many :privileges, :through => :role_privileges
  has_many :parent_roles, :through => :role_roles_as_parent_role
  has_many :child_roles, :through => :role_roles_as_child_role
  has_many :users, :through => :user_roles
  validates_presence_of :role
  validates_length_of :role, :allow_nil => false, :maximum => 50
  validates_presence_of :description
  validates_length_of :description, :allow_nil => false, :maximum => 255
end
