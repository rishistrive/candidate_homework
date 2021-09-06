# frozen_string_literal: true

# Model to store connection field mappings
class FieldMapping < ApplicationRecord
  belongs_to :connection

  validates_presence_of :local_field, :external_field
end
