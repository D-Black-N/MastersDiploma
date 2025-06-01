# frozen_string_literal: true

class Document < ApplicationRecord
  mount_uploader :file, DocumentUploader

  enum :file_type, { ndfl: 'ndfl' }

  validates :name, presence: true
end
