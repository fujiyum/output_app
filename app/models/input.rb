class Input < ApplicationRecord
  belongs_to :title
  has_many :comments, dependent: :destroy
  has_many :outputs, dependent: :destroy

  validates :input, presence: true
  validates :target, presence: true

end
