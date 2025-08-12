class Ticket < ApplicationRecord
  STATUSES = %w[open in_progress resolved closed].freeze

  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }
end
