# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :requests
  has_many :clients

  enum :role, { admin: 'admin', manager: 'manager', risk_manager: 'risk_manager' }

  validates :first_name, :last_name, presence: true
  validates :login, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
end
