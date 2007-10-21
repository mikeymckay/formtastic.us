class ComplexOb < ActiveRecord::Base
  belongs_to :mime_type, :class_name => 'MimeType', :foreign_key => :mime_type_id
  belongs_to :obs, :class_name => 'Ob', :foreign_key => :obs_id
end
