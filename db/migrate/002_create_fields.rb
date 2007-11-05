class CreateFields < ActiveRecord::Migration
  def self.up
    create_table :fields do |t|
    end
  end

  def self.down
    drop_table :fields
  end
end
