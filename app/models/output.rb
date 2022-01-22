class Output < ApplicationRecord

    belongs_to :input

    validates :output, presence: true
    validates :feedback, presence: true

end
