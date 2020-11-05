class Record < ApplicationRecord
  validates :number, :court, :actor, :defendant, :summary, presence: true

  has_many :notifications, dependent: :destroy
end
