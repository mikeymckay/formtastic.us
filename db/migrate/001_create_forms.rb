class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
    end
  end

  def self.down
    drop_table :forms
  end
end
