# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::Integrations, type: :request do
  let(:expected_integration_response) do
    {
      'id': 1,
      'name': 'Integration 1',
      'connections': [
        {
          'path': 'localhost.analytics.users',
          'field_mappings': [
            {
              'local_field': 'user_local_field_1',
              'external_field': 'user_external_field_1'
            },
            {
              'local_field': 'user_local_field_2',
              'external_field': 'user_external_field_2'
            },
            {
              'local_field': 'user_local_field_3',
              'external_field': 'user_external_field_3'
            }
          ]
        },
        {
          'path': 'localhost.analytics.orders',
          'field_mappings': [
            {
              'local_field': 'order_local_field_1',
              'external_field': 'order_external_field_1'
            },
            {
              'local_field': 'order_local_field_2',
              'external_field': 'order_external_field_2'
            },
            {
              'local_field': 'order_local_field_3',
              'external_field': 'order_external_field_3'
            }
          ]
        }
      ]
    }.deep_stringify_keys
  end

  it 'returns the integration' do
    send_request(method: :get, url: '/api/integrations/1')
    response_body = JSON.parse(response.body)

    expect(response_body).to eq(expected_integration_response)
  end

  def send_request(method:, url:, params: {})
    headers = { 'HTTP_X_REQUESTED_WITH' => 'XMLHttpRequest' }
    request = send(method, url, params: params, headers: headers)
  end
end

