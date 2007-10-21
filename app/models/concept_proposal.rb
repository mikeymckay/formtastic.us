class ConceptProposal < ActiveRecord::Base
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  belongs_to :encounter, :class_name => 'Encounter', :foreign_key => :encounter_id
  belongs_to :obs_concept, :class_name => 'Concept', :foreign_key => :obs_concept_id
  belongs_to :obs, :class_name => 'Ob', :foreign_key => :obs_id
  belongs_to :changed_by, :class_name => 'User', :foreign_key => :changed_by
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator
  belongs_to :concept_proposal, :class_name => 'ConceptProposal', :foreign_key => :concept_proposal_id
  has_many :concept_proposals, :class_name => 'ConceptProposal', :foreign_key => :concept_proposal_id
  has_many :encounters, :through => :concept_proposals
  has_many :concepts, :through => :concept_proposals
  has_many :creators, :through => :concept_proposals_as_creator
  has_many :changed_bies, :through => :concept_proposals_as_changed_by
  has_many :obs, :through => :concept_proposals_as_obs
  has_many :obs_concepts, :through => :concept_proposals_as_obs_concept
  validates_presence_of :original_text
  validates_length_of :original_text, :allow_nil => false, :maximum => 255
  validates_length_of :final_text, :allow_nil => true, :maximum => 255
  validates_presence_of :state
  validates_length_of :state, :allow_nil => false, :maximum => 32
  validates_length_of :comments, :allow_nil => true, :maximum => 255
  validates_presence_of :creator
  validates_numericality_of :creator, :allow_nil => false, :only_integer => true
  validates_presence_of :date_created
  validates_numericality_of :changed_by, :allow_nil => true, :only_integer => true
end
