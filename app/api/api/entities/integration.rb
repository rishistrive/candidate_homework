module API
  module Entities
    class FieldMapping < Grape::Entity
      expose :local_field
      expose :external_field
    end

    class Connection < Grape::Entity
      expose :joined_path, as: :path
      expose :field_mappings, using: FieldMapping

      private

      def joined_path
        [object.host, object.database, object.table].join('.')
      end
    end

    class Integration < Grape::Entity
      expose :id
      expose :name
      expose :connections, using: Connection
    end
  end
end
