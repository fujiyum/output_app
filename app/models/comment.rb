class Comment < ApplicationRecord
    
    belongs_to :input
    belongs_to :user
    
end
