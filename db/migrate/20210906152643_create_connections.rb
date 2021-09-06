# frozen_string_literal: true

# Add connections table
class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.references :integration, null: false, index: true
      t.string :username, null: false, index: true
      t.string :password, null: false
      t.string :host, null: false
      t.string :database, null: false
      t.string :table, null: false

      t.timestamps null: false
    end
  end
end
