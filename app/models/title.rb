class Title < ApplicationRecord
    
    belongs_to :user
    has_many :inputs, dependent: :destroy
    has_many :notes, dependent: :destroy
    
end
