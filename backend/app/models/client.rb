# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :requests
  has_many :documents
  belongs_to :user

  validates :first_name, :last_name, :passport_series, :passport_number, :email, :phone_number, presence: true
  validates :passport_series, format: { with: /\d{4}/ }
  validates :passport_number, format: { with: /\d{6}/ }
end
