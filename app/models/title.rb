class Title < ApplicationRecord

    belongs_to :user
    has_many :inputs, dependent: :destroy
    has_many :notes, dependent: :destroy
    has_many :nices, dependent: :destroy

    attachment :image
    
    validates :title_name, presence: true

    def niced_by?(user)
      nices.where(user_id: user.id).exists?
    end


end
