class User < ApplicationRecord
    has_many :tweets
    has_many :likes
    has_many :like_tweets, through: :likes, source: :tweet
    
    validates :uid, :pass, :age, presence: true
    validates :uid, uniqueness: true
    
    def self.authenticate(uid, pass)
        if find_by(uid: uid)
            if BCrypt::Password.new(find_by(uid: uid).pass) == pass
                return true
            end
        end
    end
end
