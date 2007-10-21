class FormentryArchive < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :formentry_archive, :class_name => 'FormentryArchive', :foreign_key => :formentry_archive_id
  has_many :formentry_archives, :class_name => 'FormentryArchive', :foreign_key => :formentry_archive_id
  has_many :creators, :through => :formentry_archives_as_creator
  validates_presence_of :form_data
  validates_presence_of :date_created
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
end
