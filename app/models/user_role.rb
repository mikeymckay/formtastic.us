class UserRole < ActiveRecord::Base
  belongs_to :role, :class_name => 'Role', :foreign_key => :role_id
  belongs_to :user, :class_name => 'User', :foreign_key => :user_id
end
