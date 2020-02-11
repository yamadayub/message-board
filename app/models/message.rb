class Message < ApplicationRecord
    validates :content, presence: true, length: {maximum: 255, minimum: 2}
    validates :title, presence: true, length: {maximum: 255, minimum: 2}
end
