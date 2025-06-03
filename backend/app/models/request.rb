# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user
  belongs_to :client

  enum :status, {
    open: 'open',
    verifying:'verifying',
    processing: 'processing',
    document_processing: 'document_processing',
    vehicle_checking: 'vehicle_checking',
    agreed: 'agreed',
    closed: 'closed'
  }

  enum :payment_type, { cash: 'cash', bank_card: 'bank_card', qr: 'qr' }
  enum :risk_level, { green: 'green', yellow: 'yellow', red: 'red', black: 'black' }

  validates :leasing_term, presence: true

  accepts_nested_attributes_for :vehicle
end
