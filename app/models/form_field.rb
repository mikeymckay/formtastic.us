class FormField < ActiveRecord::Base
  include Openmrs
  belongs_to :field
  belongs_to :form
  has_many :field_attributes, :dependent => :delete_all do
    # Allows you to call do self.field_attributes["max"]
    def [](name)
      self.find_by_field_attribute_type_id(FieldAttributeType.find_by_name(name).id).value rescue nil
    end

    def to_hash
      attributes_hash = Hash.new
      self.each{|attribute| 
        attributes_hash[attribute.name] = attribute.value
      }
      return attributes_hash
    end
  end

  def name
    return self.field.name
  end

end
