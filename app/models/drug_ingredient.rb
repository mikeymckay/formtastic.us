class DrugIngredient < ActiveRecord::Base
  belongs_to :concept, :class_name => 'Concept', :foreign_key => :concept_id
  belongs_to :ingredient, :class_name => 'Concept', :foreign_key => :ingredient_id
end
