# frozen_string_literal: true

class Vehicle < ApplicationRecord
  has_one :request

  enum :status, { finding: 'finding', verifying: 'verifying', processing: 'processing', ready: 'ready' }

  validates :brand, :vehicle_model, :year, presence: true
end
