# frozen_string_literal: true

class Vehicle < ApplicationRecord
  has_one :request

  enum :status, { finding: 0, verifying: 1, processing: 2, ready: 3 }

  validates :brand, :model, :year, presence: true
end
