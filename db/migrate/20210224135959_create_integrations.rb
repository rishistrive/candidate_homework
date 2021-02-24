class CreateIntegrations < ActiveRecord::Migration[5.2]
  def change
    create_table :integrations do |t|
      t.string :name
      t.jsonb :config,
        default: {},
        comment: 'Arbitrary JSON that the FE will parse to generate layout data'

      t.timestamps
    end
  end
end
