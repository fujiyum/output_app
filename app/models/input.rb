class Input < ApplicationRecord

    belongs_to :title
    has_many :comments, dependent: :destroy
    has_many :outputs, dependent: :destroy

    validates :input, presence: true
    validates :target, presence: true

    enum is_vaild: { '期限までに3回OUTPUT': true, '再登録': false }

    def self.input_destroy
        time = Time.now
        inputs = Input.all
        inputs.each do |input|
            if input.limit < time && input.is_valid == '期限までに3回OUTPUT'
                input.is_valid = '再登録'
                input.save
            end
        end
    end

end
