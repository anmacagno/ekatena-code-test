class Notification < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :record
end
