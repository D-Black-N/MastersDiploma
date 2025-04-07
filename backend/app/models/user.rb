# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :requests
  has_many :clients

  enum :role, { admin: 0, manager: 1, risk_manager: 2 }

  validates :login, :first_name, :last_name, :middle_name, presence: true
  validates :login, format: { in: EMAIL_REGEXP }, uniqueness: true
end
