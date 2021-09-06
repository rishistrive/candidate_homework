# frozen_string_literal: true

# repopulate data to integration, connections and field mapping table as per new schema design
class RepopulateIntegrationTableData < ActiveRecord::Migration[5.2]
  def up
    Integration.find_each do |integration|
      integration.update(connections_attributes: connection_attributes(integration.config['connections']))
    end
  end

  def down
    Connection.delete_all
    FieldMapping.delete_all
  end

  private

  def connection_attributes(connections)
    connection_attributes = []

    connections.each do |connection|
      connection_params = {
        password: connection['auth']['password'],
        username: connection['auth']['username'],
        host: connection['path']['host'],
        table: connection['path']['table'],
        database: connection['path']['database']
      }

      connection_params[:field_mappings_attributes] = field_mapping_attributes(connection['field_mapping'])
      connection_attributes << connection_params
    end

    connection_attributes
  end

  def field_mapping_attributes(field_mappings)
    field_mapping_attributes = []

    field_mappings.each do |field|
      field_mapping_params = {
        local_field: field[0],
        external_field: field[1]
      }

      field_mapping_attributes << field_mapping_params
    end

    field_mapping_attributes
  end
end
