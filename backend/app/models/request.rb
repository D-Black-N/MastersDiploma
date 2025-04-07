# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user
  belongs_to :client

  enum :status, { open: 0, verifying: 1, processing: 2, document_processing: 3, vehicle_checking: 4, closed: 5 }
  enum :payment_type, { cash: 0, bank_card: 1, qr: 2 }

  validates :leasing_term, presence: true
end
