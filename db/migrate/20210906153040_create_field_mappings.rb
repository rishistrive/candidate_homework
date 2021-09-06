# frozen_string_literal: true

# Add field mapping table
class CreateFieldMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :field_mappings do |t|
      t.references :connection, null: false, index: true
      t.string :local_field, null: false
      t.string :external_field, null: false

      t.timestamps null: false
    end
  end
end
