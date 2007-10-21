class MimeType < ActiveRecord::Base
  belongs_to :mime_type, :class_name => 'MimeType', :foreign_key => :mime_type_id
  has_many :complex_obs, :class_name => 'ComplexOb', :foreign_key => :mime_type_id
  has_many :mime_types, :class_name => 'MimeType', :foreign_key => :mime_type_id
  has_many :obs, :through => :complex_obs_as_obs
  validates_presence_of :mime_type
  validates_length_of :mime_type, :allow_nil => false, :maximum => 75
end
