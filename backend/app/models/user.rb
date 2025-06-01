# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :requests
  has_many :clients

  enum :role, { admin: 0, manager: 1, risk_manager: 2 }

  validates :first_name, :last_name, presence: true
  validates :login, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
end
