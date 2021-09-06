class RemoveColumnConfigFromIntegration < ActiveRecord::Migration[5.2]
  def change
    remove_column :integrations, :config, :jsonb
  end
end
