class Input < ApplicationRecord

    belongs_to :title
    has_many :comments, dependent: :destroy
    has_many :outputs, dependent: :destroy

    enum is_vaild: { '2週間以内に3回アウトプットしよう': true, '再登録へ': false }

    def self.input_destroy
        time = Time.now
        inputs = Input.all
        inputs.each do |input|
            if input.create_at.since(1.days) < time && input.is_valid == '2週間以内に3回アウトプットしよう'
                input.is_valid = '再登録へ'
                input.save
            end
        end
    end

end
