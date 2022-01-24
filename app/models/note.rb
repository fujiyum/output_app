class Note < ApplicationRecord
  belongs_to :title

  validates :note, presence: true
end
