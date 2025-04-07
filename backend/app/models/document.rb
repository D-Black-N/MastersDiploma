# frozen_string_literal: true

class Document < ApplicationRecord
  mount_uploader :file, DocumentUploader

  enum :type, { ndfl: 0 }

  validates :name, presence: true
end
