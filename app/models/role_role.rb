class RoleRole < ActiveRecord::Base
  belongs_to :child_role, :class_name => 'Role', :foreign_key => :child_role_id
  belongs_to :parent_role, :class_name => 'Role', :foreign_key => :parent_role_id
end
