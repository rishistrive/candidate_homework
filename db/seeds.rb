Integration.create(
  id: 1,
  name: "Integration 1",
  config: {
    connections: [
      {
        auth: {
          username: 'postgres',
          password: 'postgres'
        },
        path: {
          host: 'localhost',
          database: 'analytics',
          table: 'users'
        },
        field_mapping: [
          ['user_local_field_1', 'user_external_field_1'],
          ['user_local_field_2', 'user_external_field_2'],
          ['user_local_field_3', 'user_external_field_3']
        ]
      },
      {
        auth: {
          username: 'postgres',
          password: 'postgres'
        },
        path: {
          host: 'localhost',
          database: 'analytics',
          table: 'orders'
        },
        field_mapping: [
          ['order_local_field_1', 'order_external_field_1'],
          ['order_local_field_2', 'order_external_field_2'],
          ['order_local_field_3', 'order_external_field_3']
        ]
      }
    ]
  }
)
