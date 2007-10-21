class Person < ActiveRecord::Base
  belongs_to :patient, :class_name => 'Patient', :foreign_key => :patient_id
  belongs_to :user, :class_name => 'User', :foreign_key => :user_id
  belongs_to :person, :class_name => 'Person', :foreign_key => :person_id
  has_many :people, :class_name => 'Person', :foreign_key => :person_id
  has_many :relationships, :class_name => 'Relationship', :foreign_key => :person_id
  has_many :relationships_as_relative, :class_name => 'Relationship', :foreign_key => :relative_id
  has_many :patients, :through => :people
  has_many :users, :through => :people
  has_many :creators, :through => :relationships_as_creator
  has_many :relationships, :through => :relationships
  has_many :relationships, :through => :relationships_as_relationship
  has_many :voided_bies, :through => :relationships_as_voided_by
  has_many :people, :through => :relationships
  has_many :creators, :through => :relationships_as_creator
  has_many :relatives, :through => :relationships_as_relative
  has_many :relationships, :through => :relationships
  has_many :relationships, :through => :relationships_as_relationship
  has_many :voided_bies, :through => :relationships_as_voided_by
end
