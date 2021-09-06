# frozen_string_literal: true

# Model to store integration data
class Integration < ApplicationRecord
  has_many :connections, dependent: :destroy

  accepts_nested_attributes_for :connections, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
end
