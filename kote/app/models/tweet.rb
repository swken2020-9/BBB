class Tweet < ApplicationRecord
    belongs_to :user, optional: true #optional: trueとは、belongs_toの外部キーのnilを許可するというもの
    has_many :likes
    has_many :like_users, through: :likes, source: :user
    
    validates :user_id, :message, presence: true
end
