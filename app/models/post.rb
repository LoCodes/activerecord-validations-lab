class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :non_clickbait


    def non_clickbait
        unless [/Won't Believe/i,/Secret/i,/Guess/i,/Top [0-9]+/i].any? {|i| self.title=~ i }
            errors.add(:title, "True Facts")
        end
    end
end
