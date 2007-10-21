class RolePrivilege < ActiveRecord::Base
  belongs_to :privilege, :class_name => 'Privilege', :foreign_key => :privilege_id
  belongs_to :role, :class_name => 'Role', :foreign_key => :role_id
end
