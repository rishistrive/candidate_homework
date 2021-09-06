# frozen_string_literal: true

# Model to store integration connection data
class Connection < ApplicationRecord
  belongs_to :integration
  has_many :field_mappings, dependent: :destroy

  accepts_nested_attributes_for :field_mappings, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :username, :password, :host, :database, :table
end
