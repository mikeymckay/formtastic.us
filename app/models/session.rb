class Session < ActiveRecord::Base
  belongs_to :session, :class_name => 'Session', :foreign_key => :session_id
  has_many :sessions, :class_name => 'Session', :foreign_key => :session_id
end
